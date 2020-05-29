const initUpdateNavbarOnScroll = () => {
 const navbar = document.querySelector('.navbar-lewagon');

 if (navbar) {
  // add event listener on scroll
  window.addEventListener('scroll', () => {
  // if scroll exceeds window height, add white class
    if (window.scrollY >= window.innerHeight) {
      navbar.classList.add('navbar-lewagon-white')
    }
    else {
  // else remove it
      navbar.classList.remove('navbar-lewagon-white')
    }
  })

 }
}

export default initUpdateNavbarOnScroll
