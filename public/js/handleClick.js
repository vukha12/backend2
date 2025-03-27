const links = document.querySelectorAll(".link-menu");

const currentPath = window.location.pathname.split("/").pop();
console.log(currentPath);

links.forEach((link) => {
  const linkPath = link.getAttribute("href");

  if (linkPath === currentPath) {
    link.classList.add("active");
  } else {
    link.classList.remove("active");
  }
});
