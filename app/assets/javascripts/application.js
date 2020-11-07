// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
// require_tree .
//app/assets/javascripts以下のすべてのJavaScriptが自動で読み込まれないように

//= require jquery
//= require moment
//= require fullcalendar

//= require fullcalendar/lang/ja
//fullcalenderを日本語に



$(function() {

    // let d = new Date(Str);
    // let m = date.getMonth();
    // let day = date.getDate();
        
    if ($('#calendar').length) {
        //#calendarがあるとき

        //関数定義
        function eventCalendar() {
            //fullcalenderを返す関数
            return $('#calendar').fullCalendar({});
        };
        function clearCalendar() {
            //fullcalenderを消す関数
            $('#calendar').html('');
            //htmlのid:calenderを空白に書き換える
        };

        //fullcalenderの設定
        $('#calendar').fullCalendar({           
            lang: 'ja',

            events: {
                url: '/events.json',
                //jsonからイベント読み込み
                color: '#cdc', 
                textColor: 'ddc', 
            },

           
            customButtons:{
                yearsago:{
                    text: '1年前',
                    click:function(){
                        alert('1年前のカレンダーを表示');
                    }
                }
            },

            header: {
                left: 'month, agendaWeek, agendaDay',
                center: 'title',
                right: 'yearsago today prev,next'
            },

            defaultView: 'month', 
                       
        });
    }
});
  