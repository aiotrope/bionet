function scrollValue() {
  const navbarLg = document.querySelector('#navbar-lg');
  const navbarSm = document.querySelector('#navbar-sm');
  var scroll = window.scrollY;

  if (scroll < 300) {
    navbarLg.classList.remove('BgColour');
    navbarSm.classList.remove('BgColour');
  } else {
    navbarLg.classList.add('BgColour');
    navbarSm.classList.add('BgColour');
  }
}

window.addEventListener('scroll', scrollValue);
