document.addEventListener("turbo:load", function () {
  document.querySelectorAll(".delete-button").forEach((button) => {
    button.addEventListener("click", function (event) {
      event.preventDefault();
      const confirmDelete = confirm("本当に削除しますか？");
      if (!confirmDelete) return;

      fetch(this.href, {
        method: "DELETE",
        headers: {
          "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content,
          "Accept": "text/vnd.turbo-stream.html"
        }
      }).then(response => {
        if (response.ok) {
          this.closest(".store-item").remove();
        } else {
          console.error("削除リクエスト失敗");
        }
      }).catch(error => console.error("エラー:", error));
    });
  });
});
