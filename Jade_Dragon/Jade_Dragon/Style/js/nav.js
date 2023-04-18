let nav = document.querySelector('.nav');
nav.innerHTML = `
  <div class="modal" id="myModal">
    <div class="modal-dialog" style="margin-top: 165px;">
      <div class="modal-content">

        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Liên hệ</h4>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>

        <!-- Modal body -->
        <div class="modal-body">
          <textarea name="" id="" cols="30" rows="10" placeholder="Message"></textarea>
        </div>

        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-bs-dismiss="modal">
            Gửi tin nhắn<span></span><span></span><span></span>
          </button>
          <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
        </div>

      </div>
    </div>
  </div>
`