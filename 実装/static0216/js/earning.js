// inputChange(event) 
// 商品コードセレクタが選択された際、仕入価格と型番をJSONからHTMLに出力する
function inputChange(event){
    var jsondata_be = document.getElementById('json').innerHTML;
    jsondata = JSON.parse(jsondata_be);
    const length = Object.keys(jsondata).length;
    for (let i = 0;i<length;i++){
        if (jsondata[i].item_code == event.currentTarget.value){
            model_number.innerHTML = jsondata[i].model_number;
            purchase_price.innerHTML = '¥' + jsondata[i].purchase_price.toLocaleString();
        }
    }
}

