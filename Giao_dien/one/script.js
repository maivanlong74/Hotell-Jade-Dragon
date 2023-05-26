// script.js
window.onload = function() {
    var hotels = [
      {
        name: "Khách sạn A",
        rating: 4.5,
        review: "Khách sạn tuyệt vời!"
      },
      {
        name: "Khách sạn B",
        rating: 3.8,
        review: "Khá ổn."
      },
      {
        name: "Khách sạn C",
        rating: 5,
        review: "Tuyệt đỉnh!"
      }
    ];
  
    var hotelsContainer = document.getElementById("hotels-container");
  
    for (var i = 0; i < hotels.length; i++) {
      var hotelDiv = document.createElement("div");
      hotelDiv.classList.add("hotel");
  
      var nameElement = document.createElement("h2");
      nameElement.classList.add("hotel-name");
      nameElement.textContent = hotels[i].name;
  
      var ratingElement = document.createElement("div");
      ratingElement.classList.add("star-rating");
      ratingElement.textContent = "⭐".repeat(Math.floor(hotels[i].rating));
  
      var reviewElement = document.createElement("p");
      reviewElement.classList.add("review");
      reviewElement.textContent = hotels[i].review;
  
      hotelDiv.appendChild(nameElement);
      hotelDiv.appendChild(ratingElement);
      hotelDiv.appendChild(reviewElement);
  
      // Thêm form đánh giá
      var ratingForm = document.createElement("form");
      ratingForm.classList.add("rating-form");
  
      var ratingInput = document.createElement("input");
      ratingInput.setAttribute("type", "number");
      ratingInput.setAttribute("min", "1");
      ratingInput.setAttribute("max", "5");
      ratingInput.setAttribute("step", "0.5");
      ratingInput.setAttribute("placeholder", "Đánh giá từ 1 đến 5");
  
      var reviewInput = document.createElement("input");
      reviewInput.setAttribute("type", "text");
      reviewInput.setAttribute("placeholder", "Nhận xét");
  
      var submitButton = document.createElement("button");
      submitButton.setAttribute("type", "submit");
      submitButton.textContent = "Gửi đánh giá";
  
      ratingForm.appendChild(ratingInput);
      ratingForm.appendChild(reviewInput);
      ratingForm.appendChild(submitButton);
  
      hotelDiv.appendChild(ratingForm);
  
      hotelsContainer.appendChild(hotelDiv);
    }
  
    // Xử lý sự kiện submit form đánh giá
    var ratingForms = document.getElementsByClassName("rating-form");
    for (var j = 0; j < ratingForms.length; j++) {
      ratingForms[j].addEventListener("submit", function(e) {
        e.preventDefault();
  
        var ratingInput = this.querySelector("input[type='number']");
        var reviewInput = this.querySelector("input[type='text']");
  
        var rating = parseFloat(ratingInput.value);
        var review = reviewInput.value;
  
        // Gửi đánh giá đến server (C#)
        // Tùy chỉnh phần xử lý ở phía server (backend)
  
        // Hiển thị đánh giá mới lên trang web
        var newRatingElement = document.createElement("div");
        newRatingElement.classList.add("star-rating");
        newRatingElement.textContent = "⭐".repeat(Math.floor(rating));
  
        var newReviewElement = document.createElement("p");
        newReviewElement.classList.add("review");
        newReviewElement.textContent = review;
  
        var hotelContainer = this.parentNode;
        hotelContainer.appendChild(newRatingElement);
        hotelContainer.appendChild(newReviewElement);
  
        // Reset form
        ratingInput.value = "";
        reviewInput.value = "";
      });
    }
  };
  