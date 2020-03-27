/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//Swipper Script
var swiper = new Swiper('.swiper-container', {
    slidesPerView: 5.5,
    spaceBetween: 10,
    pagination: {
        el: '.swiper-pagination',
        clickable: true
    }
});


function redirectToPage(jspAddress) {
    window.location.href = jspAddress;
}



