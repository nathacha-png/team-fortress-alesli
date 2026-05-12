function iniciarEfecto() {
  const lanzarPetalo = () => {
    confetti({
      particleCount: 1,
      startVelocity: 0,
      ticks: 400,
      origin: {
        x: Math.random(),
        y: -0.1
      },
      shapes: ["image"],
      shapeOptions: {
        image: [
          {
            src: "imagenes/petal1.png", 
            width: 32,
            height: 32
          },
          {
            src: "imagenes/petal2.png",
            width: 32,
            height: 32
          },
          {
            src: "imagenes/petal3.png", 
            width: 32,
            height: 32
          }
        ]
      },
      gravity: 0.3,
      scalar: Math.random() * (1.2 - 0.6) + 0.6,
      drift: Math.random() - 0.5
    });
  };

  
  setInterval(lanzarPetalo, 100);
}


window.onload = iniciarEfecto;