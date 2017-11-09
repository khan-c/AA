document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!
  const listForm = document.querySelector("form");
  listForm.addEventListener("submit", event => {
    event.preventDefault();

    const formInputEl = document.querySelector(".favorite-input");
    const formInput = formInputEl.value;
    formInputEl.value = "";

    const ul = document.getElementById("sf-places");
    const li = document.createElement("li");
    li.textContent = formInput;

    ul.appendChild(li);
  });


  // adding new photos

  // --- your code here!
  let formHid = document.querySelector(".photo-form-container");

  const button = document.querySelector(".photo-show-button");
  button.addEventListener("click", event => {
    if (formHid.className === "photo-form-container hidden") {
      formHid.className = "photo-form-container";
    } else {
      formHid.className = "photo-form-container hidden";
    }

  });

  formHid.addEventListener("submit", event => {
    event.preventDefault();

    const formInputEl = document.querySelector(".photo-url-input");
    const formInput = formInputEl.value;
    formInputEl.value = "";

    const ul = document.getElementsByClassName("dog-photos")[0];
    const li = document.createElement("li");
    const img = document.createElement("img");
    img.src = formInput;
    li.appendChild(img);
    ul.appendChild(li);
  });



});
