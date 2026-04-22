(function () {
  "use strict";

  function applyHeroMedia() {
    var cfg = window.ULTRA_SITE || {};
    var term = document.querySelector(".js-hero-terminal");
    var cap = document.querySelector(".js-hero-capture");
    var img = cap ? cap.querySelector(".hero__capture-img") : null;
    if (!term || !cap || !img) return;

    var useShot =
      !!cfg.heroUseScreenshot &&
      typeof cfg.heroScreenshotSrc === "string" &&
      cfg.heroScreenshotSrc.length > 0;

    if (useShot) {
      term.setAttribute("hidden", "");
      term.removeAttribute("data-tilt");
      cap.removeAttribute("hidden");
      img.src = cfg.heroScreenshotSrc;
      img.alt = cfg.heroScreenshotAlt || "Ultra Nvim";
    } else {
      cap.setAttribute("hidden", "");
      term.removeAttribute("hidden");
    }
  }

  applyHeroMedia();

  const toggle = document.querySelector("[data-nav-toggle]");
  const drawer = document.querySelector("[data-nav-drawer]");

  if (toggle && drawer) {
    toggle.addEventListener("click", function () {
      const open = drawer.hasAttribute("hidden");
      if (open) {
        drawer.removeAttribute("hidden");
        toggle.setAttribute("aria-expanded", "true");
      } else {
        drawer.setAttribute("hidden", "");
        toggle.setAttribute("aria-expanded", "false");
      }
    });

    drawer.querySelectorAll("a").forEach(function (link) {
      link.addEventListener("click", function () {
        drawer.setAttribute("hidden", "");
        toggle.setAttribute("aria-expanded", "false");
      });
    });
  }

  document.querySelectorAll("[data-reveal]").forEach(function (el, i) {
    el.style.transitionDelay = Math.min(i * 45, 280) + "ms";
  });

  var revealObserver = new IntersectionObserver(
    function (entries) {
      entries.forEach(function (entry) {
        if (entry.isIntersecting) {
          entry.target.classList.add("is-visible");
          revealObserver.unobserve(entry.target);
        }
      });
    },
    { rootMargin: "0px 0px -8% 0px", threshold: 0.08 }
  );

  document.querySelectorAll("[data-reveal]").forEach(function (el) {
    revealObserver.observe(el);
  });

  var tilt = document.querySelector("[data-tilt]");
  if (tilt && window.matchMedia("(pointer: fine)").matches) {
    var reduce = window.matchMedia("(prefers-reduced-motion: reduce)");
    if (!reduce.matches) {
      tilt.addEventListener("pointermove", function (e) {
        var r = tilt.getBoundingClientRect();
        var x = (e.clientX - r.left) / r.width - 0.5;
        var y = (e.clientY - r.top) / r.height - 0.5;
        var rx = (-y * 8).toFixed(2);
        var ry = (x * 10).toFixed(2);
        tilt.querySelector(".terminal").style.transform =
          "rotateX(" + rx + "deg) rotateY(" + ry + "deg)";
      });
      tilt.addEventListener("pointerleave", function () {
        tilt.querySelector(".terminal").style.transform = "";
      });
    }
  }

  var tabButtons = document.querySelectorAll("[data-tab]");
  var panels = document.querySelectorAll("[data-panel]");
  tabButtons.forEach(function (btn) {
    btn.addEventListener("click", function () {
      var id = btn.getAttribute("data-tab");
      tabButtons.forEach(function (b) {
        b.classList.toggle("is-active", b === btn);
        b.setAttribute("aria-selected", b === btn ? "true" : "false");
      });
      panels.forEach(function (p) {
        var match = p.getAttribute("data-panel") === id;
        p.classList.toggle("is-visible", match);
        if (match) {
          p.removeAttribute("hidden");
        } else {
          p.setAttribute("hidden", "");
        }
      });
    });
  });

  document.querySelectorAll("[data-copy]").forEach(function (btn) {
    btn.addEventListener("click", function () {
      var sel = btn.getAttribute("data-copy");
      var el = document.querySelector(sel);
      if (!el) return;
      var text = el.textContent || "";
      function done() {
        btn.classList.add("is-done");
        var prev = btn.textContent;
        btn.textContent = "Copiado";
        window.setTimeout(function () {
          btn.classList.remove("is-done");
          btn.textContent = prev;
        }, 1600);
      }
      if (navigator.clipboard && navigator.clipboard.writeText) {
        navigator.clipboard.writeText(text).then(done).catch(function () {
          fallbackCopy(text, done);
        });
      } else {
        fallbackCopy(text, done);
      }
    });
  });

  function fallbackCopy(text, cb) {
    var ta = document.createElement("textarea");
    ta.value = text;
    ta.setAttribute("readonly", "");
    ta.style.position = "fixed";
    ta.style.left = "-9999px";
    document.body.appendChild(ta);
    ta.select();
    try {
      document.execCommand("copy");
      cb();
    } catch (e) {
      /* ignore */
    }
    document.body.removeChild(ta);
  }

})();
