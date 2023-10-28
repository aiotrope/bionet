function scrollValue() {
  const navbarLg = document.querySelector('#navbar-lg');
  const navbarSm = document.querySelector('#navbar-sm');
  var scroll = window.scrollY;

  if (scroll < 300) {
    navbarLg.classList.remove('topNavBg');
    navbarSm.classList.remove('topNavBg');
  } else {
    navbarLg.classList.add('topNavBg');
    navbarSm.classList.add('topNavBg');
  }
}

window.addEventListener('scroll', scrollValue);
