#!/usr/bin/perl
use CGI;
use DBI;
$hostname="localhost";
$username="u20180571";
$password="zgW8kbjv";
$database="u20180571";
$dsn="DBI:mysql:database=$database;host=$hostname;port=$port";
$dbh=DBI->connect($dsn,$username,$password);

$sth=$dbh->prepare("select ID,Numero,Estado,Moneda,Tarjeta_ID,Cliente_ID from accounts");
$sth->execute();
print "Content-type:text/html\n\n";
print "<!DOCTYPE html>\n";
print "<html><head><title>Editar Cuentas</title>\n";
print "<link rel='stylesheet' href='../css/bankStyle.css'></head>\n";
print "<body>\n";
print "<div class='c'>\n";
print "<div class='c1'>\n";
print "<h1>Editar Cuentas</h1>\n";
print "<form action='editAccounts2.pl'>\n";
print "<select onChange='fillValues()' id='account_id' name='select'>\n";
while(@accounts=$sth->fetchrow_array()){
	print "<option value=\"$accounts[0],$accounts[1],$accounts[2],$accounts[3],$accounts[4],$accounts[5]\">$accounts[1]</option>\n";
}
print "</select><br>\n";
print "<input type='hidden' id='id' name='id'><br>\n";
print "<input id='numero' name='numero'><br>\n";
print "<input id='estado' name='estado'><br>\n";
print "<input id='moneda' name='moneda'><br>\n";
print "<input id='tarjeta_id'  name='tarjeta_id'><br>\n";
print "<input id='cliente_id' name='cliente_id'><br>\n"; 
print "<input type='submit' value='Guardar cambios'><br>\n";
print "<input type='button' value='Deshacer cambios' onClick='fillValues()'><br>\n";
print "</form>\n";
print "</div>\n";
print "</div>\n";
print "</body>\n";
print "<script>";
print "function fillValues(){\n";
print "var arr=[5];";
print "var data=document.getElementById('account_id').value;\n";
print "for(var i=0;i<6;i++){";
print "var index=data.indexOf(',');";
print "if(index!=-1){";
print "arr[i]=data.substring(0,index);";
print "data=data.substring(index+1,data.length);";
print "}else{";
print "arr[i]=data}";
print "console.log(arr);";
print "document.getElementById('id').value=arr[0];\n";
print "document.getElementById('numero').value=arr[1];\n";
print "document.getElementById('estado').value=arr[2];\n";
print "document.getElementById('moneda').value=arr[3];\n";
print "document.getElementById('tarjeta_id').value=arr[4];\n";
print "document.getElementById('cliente_id').value=arr[5];\n";
print "}";
print "}\n";
print "fillValues();";
print "</script>\n";
print "</html>";
