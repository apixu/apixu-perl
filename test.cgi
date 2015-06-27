#!/usr/bin/perl
use strict;

use CGI;

use APIXU::API::APIXU;
use Data::Dumper;

my $cgi = CGI->new();
print $cgi->header();

my $api_key = 'a969f7a28ca84568874105630151006';
my $apixu = APIXU::API::APIXU->new($api_key);

print qq{
     <script type="text/javascript">
          function validate(){
               var api_exp  = document.getElementById('api_explorer').value;
               var location = document.getElementById('location').value;
               var days     = document.getElementById('days').value;
               //alert("API="+api_exp+"\\nlocation="+location+"\\nDays="+days);
               var message = '';
               if(location == ''){
                    message += "Enter Location\\n";
               }
               if(api_exp == 'Forecast' && days == ''){
                    message += "Enter Days\\n";
               }
               if(message != ''){
                    alert("Error : \\n"+message);
                    return false;
               }
          }
     </script>
};

print qq{
     <div style="width:620px;margin:auto; padding:10px;background-color:#f6f6f6;">
          <form action="" method="post" onSubmit="return validate();">
               <div>
                    <div style="display:inline-block; width:250px;">
                    API Explorer :
                    </div>
                    <div style="display:inline-block; width:350px;">
                         <select name="api_explorer" id="api_explorer">
                              <option value="Current">Current</option>
                              <option vlaue="Forecast">Forecast</option>
                         </select>
                    </div>
               </div>
               <br>
               <div>
                    <div style="display:inline-block; width:250px;">
                    Location :
                    </div>
                    <div style="display:inline-block; width:350px;">
                         <input type="text" name="location" id="location"/>
                    </div>
               </div>
               <br>
               <div>
                    <div style="display:inline-block; width:250px;">
                    Days (If API Explorer is Forecast) :
                    </div>
                    <div style="display:inline-block; width:350px;">
                         <input type="text" name="days" id="days"/>
                    </div>
               </div>
               <input type="hidden" name="action" value="call_api">
               <br><hr>
               <input type="submit" value="Submit">
          </form>
     </div>
     <hr>
};

my ($api_explorer, $location, $days);
if ($cgi->param('action') eq 'call_api') {
     $api_explorer = $cgi->param('api_explorer');
     $location     = $cgi->param('location');
     $days     = $cgi->param('days');
     print qq{Selected API explorer => $api_explorer<br>};
     print qq{Selected Location => $location<br>};
     print qq{Selected days => $days<br><hr>};
     print qq{<div id="message">API request started.  Please wait</div><br>};     
     my $json_decoded_hash_ref;
     if ($api_explorer eq 'Current') {
          print "Current<br>";
          $json_decoded_hash_ref = $apixu->get_current($location);
     }
     elsif($api_explorer eq 'Forecast'){
          print "Forecast<br>";
          $json_decoded_hash_ref = $apixu->get_forecast($location, $days);
          
     }
     
     print qq{Following hash is the perl equivalent of the json response from the API<br>};
     print qq{<pre>};
     print Data::Dumper->Dump([$json_decoded_hash_ref], ['*json_decoded_hash_ref']);
     print qq{</pre>};
}

print qq{
    <script type="text/javascript">
         //alert('haii');
         document.getElementById('message').innerHTML = "";
    </script>
};