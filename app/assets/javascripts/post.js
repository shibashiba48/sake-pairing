$(document).on('turbolinks:load', ()=> {

  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="post[images_attributes][${index}][src]"
                    id="post_images_attributes_${index}_src"><br>
                  </div>`;
    return html;
  }
  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src= "${url}" width="200px" height="200px">
                    <div class="lower-box">
                      <label class="update-box" for="post_images_attributes_${index}_src">変更</label>
                      <div class="js-remove">削除</div>
                    </div>
                  </div>`
    return html;
  }

  // file_filedのnameに動的なindeをつける為の配列
  let fileIndex = [1,2,3];
  // 既に使われているindexを除外
  lastIndex = $(".js-file_group:last").data("index");
  fileIndex.splice(0, lastIndex);
  $(".hidden-destroy").hide();

  $('#image-box').on('change', '.js-file', function() {
    const targetIndex = $(this).parent().data("index");
    // ファイルのブラウザ上でのURLを取得する
    const file = this.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    // 該当indexを持つimgタグがあれば取得して変数imgに入れる（画像変更の処理）
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute("src", blobUrl);
    } else { // 新規画像追加の処理
      $("#previews").append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $("#image-box").append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    }
    // プレビューがあったらラベルを隠す
    if ($(".js-file_group").length >= 1) {
      $(".label").hide();
    }
  });

  // 画像の削除
  $('#image-box').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index')
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();

    // 画像入力欄が0個にならないようにしておく
    if ($('#previews').length < 1) {
      $(".label").show();
    }
  });
});
