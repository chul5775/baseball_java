// Blocking drag
document.onselectstart = () => {
    return false
}

$(document).ready(() => {
    // Main navigation
    const navigation = document.querySelector('#navigation')
    // Main top division background image
    const topBg = document.querySelector('#topBg')
    $(window).scroll(() => {
        // Main top division background image height value: 902px
        if ($(window).scrollTop() > topBg.clientHeight - 22) {
            navigation.classList.remove('navbar-color-original')
            navigation.classList.add('navbar-color')
        } else {
            navigation.classList.remove('navbar-color')
            navigation.classList.add('navbar-color-original')
        }
    })
})