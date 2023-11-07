$(document).keyup(function(e) {
    if (e.key === "Escape") {
        $('body').fadeOut(500);
        $(".container").fadeOut(300);
        setTimeout(() => {
            $('body').css("display", "none");
        },500)
        $.post('https://shn_q/exit', JSON.stringify({}));
    }
});

$('document').ready(function() {
    quest = {};

    Object.size = function(obj) {
        var size = 0,
          key;
        for (key in obj) {
          if (obj.hasOwnProperty(key)) size++;
        }
        return size;
      };

    quest.enter = function(data) {
        var input = false;
        window.obj = JSON.parse(data.array);
        $(".container").fadeIn(500);
        $(".nazwa").text(data.name);
        $(".text").text(data.text);
        for (let i = 1; i <= Object.size(obj); i++){
            switch(obj["p"+i].type){
                case "button":
                    if (input === true){
                        $(".b"+(i-1)).text(obj["p"+i].text);
                        $(".b"+(i-1)).fadeIn(300);
                    }else{
                        $(".b"+i).text(obj["p"+i].text);
                        $(".b"+i).fadeIn(300);
                    }
                    if (i <= Object.size(obj)){
                        break;
                    }
                case "input":
                    input = true
                    $(".i1").fadeIn(300);
                    $(".button").css("display", "inline")
                    if (i <= Object.size(obj)){
                        break;
                    }
                default:
                    console.log("ERR: " + "'" +obj["p"+i].type + "'" + " Nie jest dobrym typem")
                    break;
            }
        }
    };

    quest.exit = function() {
        var input = false;
        for (let i = 1; i <= Object.size(obj); i++){
            switch(obj["p"+i].type){
                case "button":
                    if (input === true){
                        $(".b"+(i-1)).css("display", "none")
                    }else{
                        $(".b"+i).css("display", "none")
                    }
                    if (i <= Object.size(obj)){
                        break;
                    }
                case "input":
                    input = true
                    $(".i1").css("display", "none")
                    $(".button").css("display", "none")
                    if (i <= Object.size(obj)){
                        break;
                    }
            }
        }
        $(".container").css("display", "none")
        $('body').css("display", "none");
        $.post('https://shn_q/exit', JSON.stringify({}));
    };

    quest.next = function() {
        var input = false;
        for (let i = 1; i <= Object.size(obj); i++){
            switch(obj["p"+i].type){
                case "button":
                    if (input === true){
                        $(".b"+(i-1)).css("display", "none")
                    }else{
                        $(".b"+i).css("display", "none")
                    }
                    if (i <= Object.size(obj)){
                        break;
                    }
                case "input":
                    input = true
                    $(".i1").css("display", "none")
                    $(".button").css("display", "none")
                    if (i <= Object.size(obj)){
                        break;
                    }
            }
        }
        $(".container").css("display", "none")
        $('body').css("display", "none");
    };
    
    window.addEventListener('message', function(event) {
        switch(event.data.action) {
            case 'enter':
                $(".container").css({"opacity":1})
                $("body").css({"opacity":1})
                $('body').css("display", "inline")
                quest.enter(event.data);
                break;
            case 'exit':
                quest.exit();
                break;
        }
    })
});