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

  const addList = (e) => {
    e.preventDefault();
    const newInputEl = document.getElementsByClassName("favorite-input");
    const newInput = newInputEl[0].value;
    newInputEl.value = "";
    const ul = document.getElementById("sf-places");
    const li = document.createElement("li");
    li.textContent = newInput;
    ul.appendChild(li);
  };

  const buttons = document.getElementsByClassName("favorite-submit");
  for(var i = 0; i < buttons.length; i++){
    buttons.item(i).addEventListener("click", addList);
  }

  // adding new photos

  const toggleForm = (e) => {
    e.preventDefault();
    const form = document.querySelector(".photo-form-container");
    if (form.className === "photo-form-container hidden") {
      form.className = "photo-form-container";
    } else {
      form.className = "photo-form-container hidden";
    }
  };

  const toggleButton = document.getElementsByTagName('button');
  toggleButton[0].addEventListener("click", toggleForm);

  const addDog = (e) => {
    e.preventDefault();
    const dogUrlInput = document.querySelector(".photo-url-input");

    const img = document.createElement("img");
    img.src = dogUrlInput.value;
    dogUrlInput.value = "";

    const li = document.createElement("li");
    li.appendChild(img);

    const ul = document.querySelector(".dog-photos");
    ul.appendChild(li);
  };

  const addDogButton = document.querySelector(".photo-url-submit");
  addDogButton.addEventListener("click", addDog);
});
