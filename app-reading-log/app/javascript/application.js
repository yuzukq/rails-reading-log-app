import "@hotwired/turbo-rails"
import "controllers"

// スクロールヒント
import { ScrollHint } from "scroll-hint";

document.addEventListener("turbo:load", () => {
  new ScrollHint('.scroll-hint', {
    suggestiveShadow: true,
    scrollHintIconAppendClass: 'scroll-hint-icon-white', // 白系の矢印に
    i18n: {
      scrollable: 'スクロールできます'
    }
  });
});



