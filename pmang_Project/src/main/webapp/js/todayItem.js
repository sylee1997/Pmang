
      /* 인기 카테고리 슬라이드 쇼 이벤트 */
      var ul = document.querySelector('.slide_wrap');
      function move() {
         var curIndex = 0;
         setInterval(function() {
            ul.style.transition = '0.5s';
            ul.style.transform = "translate3d(-" + 1024 * (curIndex + 1)
                  + "px, 0px, 0px)";
            curIndex++;
            if (curIndex === 4) {
               curIndex = -1;
            }
         }, 1000);
      }
      document.addEventListener("DOMContentLoaded", function() {
         // 
         move();
      });
      /* 인기 카테고리 슬라이드 쇼 이벤트 */

