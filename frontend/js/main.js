/* ── TOGGLE CONTRASEÑA ── */
function togglePass(inputId, btn) {
  const input = document.getElementById(inputId);
  const isPassword = input.type === 'password';
  input.type = isPassword ? 'text' : 'password';

  btn.querySelector('svg').innerHTML = isPassword
    ? 
      '<path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/>'
    :
      '<path d="M17.94 17.94A10.07 10.07 0 0112 20c-7 0-11-8-11-8a18.45 18.45 0 015.06-5.94M9.9 4.24A9.12 9.12 0 0112 4c7 0 11 8 11 8a18.5 18.5 0 01-2.16 3.19m-6.72-1.07a3 3 0 11-4.24-4.24"/><line x1="1" y1="1" x2="23" y2="23"/>';
}

/* ── LLUVIA DE PÉTALOS ── */
(function () {
  const canvas = document.getElementById('petals-canvas');
  if (!canvas) return;

  const ctx = canvas.getContext('2d');
  let W, H;
  const petals = [];

  const COLORS = [
    '#f4b8cc', '#e8607a', '#fce4ef',
    '#be3a6e', '#f9d5e9', '#e8a0ba'
  ];

  function resize() {
    W = canvas.width  = window.innerWidth;
    H = canvas.height = window.innerHeight;
  }
  resize();
  window.addEventListener('resize', resize);

  function makePetal(randomY = false) {
    return {
      x:        Math.random() * (W || window.innerWidth),
      y:        randomY ? Math.random() * (H || window.innerHeight) : -20,
      r:        4 + Math.random() * 9,
      rot:      Math.random() * Math.PI * 2,
      rotSpeed: (Math.random() - 0.5) * 0.06,
      vx:       (Math.random() - 0.5) * 1.2,
      vy:       0.6 + Math.random() * 1.2,
      alpha:    0.4 + Math.random() * 0.5,
      color:    COLORS[Math.floor(Math.random() * COLORS.length)],
      phase:    Math.random() * Math.PI * 2,
      swayAmp:  0.3 + Math.random() * 0.7,
    };
  }

  /* Poblar pantalla al inicio */
  for (let i = 0; i < 34; i++) petals.push(makePetal(true));

  function drawPetal(p) {
    ctx.save();
    ctx.translate(p.x, p.y);
    ctx.rotate(p.rot);
    ctx.globalAlpha = p.alpha;
    ctx.fillStyle   = p.color;
    ctx.beginPath();
    ctx.ellipse(0, 0, p.r * 0.55, p.r, 0, 0, Math.PI * 2);
    ctx.fill();
    ctx.restore();
  }

  let t = 0;
  function loop() {
    ctx.clearRect(0, 0, W, H);
    t += 0.016;

    petals.forEach(p => {
      p.x   += p.vx + Math.sin(t + p.phase) * p.swayAmp;
      p.y   += p.vy;
      p.rot += p.rotSpeed;
      if (p.y > H + 20) Object.assign(p, makePetal(false));
      drawPetal(p);
    });
    requestAnimationFrame(loop);
  }
  loop();

  /* Agregar pétalos gradualmente */
  setInterval(() => {
    if (petals.length < 50) petals.push(makePetal(false));
  }, 1200);
})();
