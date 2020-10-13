document.addEventListener("DOMContentLoaded", function() {

  /**
   * Form Select
   */
  class FormSelect {
    constructor($el) {
      this.$el = $el;
      this.options = [...$el.children];
      this.init();
    }

    init() {
      this.createElements();
      this.addEvents();
      this.$el.parentElement.removeChild(this.$el);
    }

    createElements() {
      // Input for value
      this.valueInput = document.createElement("input");
      this.valueInput.type = "text";
      this.valueInput.name = this.$el.name;

      // Dropdown container
      this.dropdown = document.createElement("div");
      this.dropdown.classList.add("dropdown");

      // List container
      this.ul = document.createElement("ul");

      // All list options
      this.options.forEach((el, i) => {
        const li = document.createElement("li");
        li.dataset.value = el.value;
        li.innerText = el.innerText;

        if (i === 0) {
          // First clickable option
          this.current = document.createElement("div");
          this.current.innerText = el.innerText;
          this.dropdown.appendChild(this.current);
          this.valueInput.value = el.value;
          li.classList.add("selected");
        }

        this.ul.appendChild(li);
      });

      this.dropdown.appendChild(this.ul);
      this.dropdown.appendChild(this.valueInput);
      this.$el.parentElement.appendChild(this.dropdown);
    }

    addEvents() {
      this.dropdown.addEventListener("click", e => {
        const target = e.target;
        this.dropdown.classList.toggle("selecting");

        // Save new value only when clicked on li
        if (target.tagName === "LI") {
          this.valueInput.value = target.dataset.value;
          this.current.innerText = target.innerText;
        }
      });
    }
  }
  document.querySelectorAll(".form-group--dropdown select").forEach(el => {
    new FormSelect(el);
  });

  /**
   * Hide elements when clicked on document
   */
  document.addEventListener("click", function(e) {
    const target = e.target;
    const tagName = target.tagName;

    if (target.classList.contains("dropdown")) return false;

    if (tagName === "LI" && target.parentElement.parentElement.classList.contains("dropdown")) {
      return false;
    }

    if (tagName === "DIV" && target.parentElement.classList.contains("dropdown")) {
      return false;
    }

    document.querySelectorAll(".form-group--dropdown .dropdown").forEach(el => {
      el.classList.remove("selecting");
    });
  });

  /**
   * Switching between form steps
   */
  class FormSteps {
    constructor(form) {
      this.$form = form;
      this.$next = form.querySelectorAll(".next-step");
      this.$prev = form.querySelectorAll(".prev-step");
      this.$step = form.querySelector(".form--steps-counter span");
      this.$agreeBtn = form.querySelector(".agree-btn");
      this.$stepCounter = form.querySelector(".form--steps-counter");
      this.currentStep = 1;
      this.slides = form.querySelectorAll("form > div");
      this.init();
      this.updateSummary();
    }

    /**
     * Init all methods
     */
    init() {
      this.events();
      this.updateForm();
    }

    /**
     * All events that are happening in form
     */
    events() {
      // Next step
      this.$next.forEach(btn => {
        btn.addEventListener("click", e => {
          e.preventDefault();
          this.currentStep++;
          this.updateForm();
        });
      });

      // Previous step
      this.$prev.forEach(btn => {
        btn.addEventListener("click", e => {
          e.preventDefault();
          this.currentStep--;
          this.updateForm();
        });
      });

      // Form submit
      this.$form.querySelector("form").addEventListener("submit", e => this.submit(e));
    }

    /**
     * Update form front-end
     * Show next or previous section etc.
     */
    updateForm() {
      this.$step.innerText = this.currentStep;
      if (this.currentStep < 2) this.$prev.forEach(el => el.classList.add("hidden"));
      if (this.currentStep === 2) this.$prev.forEach(el => el.classList.remove("hidden"));
      if (this.currentStep > 4) this.$next.forEach(el => el.classList.add("hidden"));
      if (this.currentStep === 4) this.$next.forEach(el => el.classList.remove("hidden"));
      if (this.currentStep === 5) {
        this.updateSummary();
        this.$stepCounter.classList.add("hidden");
        this.$agreeBtn.classList.remove("hidden");

      }
      if (this.currentStep < 5) {
        this.$stepCounter.classList.remove("hidden");
        this.$agreeBtn.classList.add("hidden");
      }

      this.slides.forEach(slide => {
        slide.classList.remove("active");
        if (slide.dataset.step == this.currentStep) {
          slide.classList.add("active");
        }
      });

    }
    updateSummary() {

      //get values

      const $categoryLabels = form.querySelectorAll(".category")
      var categoriesFromForm = [];
      for (const $label of $categoryLabels) {
        if ($label.querySelector('[name="categories"]').checked) {
          categoriesFromForm.push($label.querySelector("span").innerText);
        }
      }
      const numberOfBags = form.querySelector("#quantity").value
      const institutionName = form.querySelector(".dropdown").firstChild.textContent;
      const street = form.querySelector("#street").value;
      const city = form.querySelector("#city").value;
      const zipCode = form.querySelector("#zipCode").value;
      const phoneNumber = form.querySelector("#phoneNumber").value;
      const pickUpDate = form.querySelector("#pickUpDate").value;
      const pickUpTime = form.querySelector("#pickUpTime").value;
      const pickUpComment = form.querySelector("#pickUpComment").value;

      //insert values

      const $infoNumberOfBags = form.querySelector("#infoNumberOfBags");
      $infoNumberOfBags.innerText = numberOfBags;
      const $infoCategories = form.querySelector("#infoCategories");
      $infoCategories.innerHTML = "";
      for (const category of categoriesFromForm) {
        const $categoryDiv = document.createElement("div");
        $categoryDiv.innerText = category;
        $categoryDiv.classList.add("info-box-text");
        $infoCategories.appendChild($categoryDiv);
      }
      const $infoInstitution = form.querySelector("#infoInstitution");
      $infoInstitution.innerText = institutionName;
      const $infoStreet = form.querySelector("#infoStreet");
      $infoStreet.innerText = street;
      const $infoCity = form.querySelector("#infoCity");
      $infoCity.innerText = city;
      const $infoZipCode = form.querySelector("#infoZipCode");
      $infoZipCode.innerText = zipCode;
      const $infoPhoneNumber = form.querySelector("#infoPhoneNumber");
      $infoPhoneNumber.innerText = phoneNumber;
      const $infoPickUpDate = form.querySelector("#infoPickUpDate");
      $infoPickUpDate.innerText = pickUpDate;
      const $infoPickUpTime = form.querySelector("#infoPickUpTime");
      $infoPickUpTime.innerText = pickUpTime;
      const $infoPickUpComment = form.querySelector("#infoPickUpComment");
      $infoPickUpComment.innerText = pickUpComment;


    }


  }

  const form = document.querySelector(".form--steps");
  if (form !== null) {
    new FormSteps(form);
  }
});
