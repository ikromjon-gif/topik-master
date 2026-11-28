export const THEME_STORAGE_KEY = "sabaq-theme";

/**
 * <head> ichida sahifa chizilishidan oldin ishlaydi va `.dark` klassini
 * qo'yadi, shunda yorug' va qorong'i rejim o'rtasida miltillash bo'lmaydi.
 * localStorage ishlamasa (masalan, ba'zi brauzer rejimlarida) tizim
 * sozlamasi ishlatiladi.
 */
export const themeInitScript = `(function(){try{var t=null;try{t=localStorage.getItem("${THEME_STORAGE_KEY}")}catch(e){}var d=t==="dark"||((t===null||t==="system")&&window.matchMedia("(prefers-color-scheme: dark)").matches);var r=document.documentElement;r.classList.toggle("dark",d);r.style.colorScheme=d?"dark":"light"}catch(e){}})();`;
