const initUpdateTitlerOnScroll = () => {
  const cocktails = document.querySelector('cocktails');
  const title = document.querySelector('#cocktails-title');
  if (title) {
    window.addEventListener('scroll', () => {
      if (cocktails.scrollY >= cocktails.innerHeight) {
        title.classList.remove('border-bottom text-white');
      } else {
        title.classList.add('border-bottom text-white');
      }
    });
  }
}

export { initUpdateTitleOnScroll };
