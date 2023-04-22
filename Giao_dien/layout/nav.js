let nav = document.querySelector('.nav');
nav.innerHTML= `
<link rel="stylesheet" href="/Style/css/layout/modal.css">
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
          <div class="hienthi_tinnhan">
          <ul id="contentMsg">
              <li><i>Name:</i> hahaa</li>
              <li><i>Name:</i> heheh</li>
              <li><i>Name:</i> hihi</li>
              <li><i>Name:</i> shdj</li>
              <li><i>Name:</i> hahaa</li>
              <li><i>Name:</i> heheh</li>
              <li><i>Name:</i> hihi</li>
      </ul>
          </div>
          <input type="text" name="" id="" placeholder="Nhập tin nhắn">
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