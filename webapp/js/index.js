const customers = Array.from(document.querySelectorAll(".customers"));
let slideIndex = 0;
let interval;

function showSlide(index) {
  if (index < 0) {
    slideIndex = customers.length - 1;
  } else if (index >= customers.length) {
    slideIndex = 0;
  } else {
    slideIndex = index;
  }

  customers.forEach((customer) => {
    customer.style.display = "none";
  });

  customers[slideIndex].style.display = "block";
}

function changeSlide(n) {
  clearInterval(interval);
  showSlide(slideIndex + n);
  startSlideshow();
}

function startSlideshow() {
  interval = setInterval(() => {
    changeSlide(1);
  }, 3000);
}

startSlideshow();