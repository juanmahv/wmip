/*!
  * KDE Plasma script to display the current IP address and ISP
  *
  * Juan de Hoyos <juanmahv@gmail.com>
  * 02.May.2014
  */
import QtQuick 1.0;

Item {
    id:root

    width: 250
    height: 100
    property string ip: ""
    property string isp: ""

    function callback(x){
        if (x.responseText) {
            var d = JSON.parse(x.responseText);
            root.ip = d.query;
            root.isp = d.isp;
        }
    }

    function request(url, callback) {
       var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = (function f() {callback(xhr)});
       xhr.open('GET', url, true);
       xhr.send();
   }

    Timer {
        running: true
        triggeredOnStart: true
        interval: 60000
        onTriggered: request('http://ip-api.com/json',callback)
    }

    Column{
        Text {  text: "IP Address: "+root.ip }
        Text {  text: "ISP: "+root.isp }
    }
}
