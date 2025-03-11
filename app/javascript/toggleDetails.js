//ページが完全に読み込まれた後にスクリプトを実行
document.addEventListener("DOMContentLoaded", () => {
  console.log("toggleDetails.js is loaded!");  // デバッグ用ログ

  //.toggle-details クラスを持つ全ての <a> 要素に click イベントを設定
  document.querySelectorAll(".toggle-details").forEach((element) => {
    element.addEventListener("click", (event) => {
      event.preventDefault();
      //id="details-STORE_IDのdivを取得して、クリックされた店舗の詳細情報を表示、非表示の切り替え
      let storeId = event.target.dataset.storeId;
      let detailsDiv = document.getElementById(`details-${storeId}`);

      console.log(`toggleDetails called for storeId: ${storeId}`); // デバッグ用ログ

      //display:none;とisplay:blockの切り替え
      if (detailsDiv.style.display === "none" || detailsDiv.style.display === "") {
        detailsDiv.style.display = "block";
      } else {
        detailsDiv.style.display = "none";
      }
    });
  });
});
