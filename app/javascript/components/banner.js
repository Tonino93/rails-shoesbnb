import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Le Talon à Votre Portée!"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
