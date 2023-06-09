// Đánh giá độ phổ biến của từng sao (ví dụ)
const ratings = [0, 0, 1, 0, 0];

// Lấy các phần tử giao diện
const starElements = document.querySelectorAll('.star');
const ratingCountElement = document.querySelector('.rating-count');
const demElements = document.querySelectorAll('.dem');

// Tính tổng rating và tỷ lệ điều chỉnh
const totalRatings = ratings.reduce((total, rating) => total + rating, 0);
const adjustmentRatio = 100 / totalRatings;

// Cập nhật số sao và độ phổ biến
starElements.forEach((star, index) => {
  const adjustedWidth = ratings[index] * adjustmentRatio;
  star.style.width = adjustedWidth + '%';
  demElements[index].textContent = ratings[index];
});

ratingCountElement.textContent = totalRatings;


