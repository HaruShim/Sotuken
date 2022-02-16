
// obj(table要素)の行数を数える
function countrow(obj){
    var row = obj.rows.length -1;
    return row
}

    /**
 * 行削除
 */
function deleteRow(obj) {
    // 削除ボタンを押下された行を取得
    tr = obj.parentNode.parentNode;
    // trのインデックスを取得して行を削除する
    tr.parentNode.deleteRow(tr.sectionRowIndex);
    var table = document.getElementById('esttable');
    document.getElementById("kosuu").textContent = countrow(table);
    document.getElementById("nedan").textContent = countsp();
}

function inputChange(event){
    // alert(event.currentTarget.value);
    var jsondata_be = document.getElementById('json').innerHTML;
    // alert(jsondata_be);
    jsondata = JSON.parse(jsondata_be);
    // 0,1,2,3,4...
    // alert(JSON.stringify(jsondata[0].category));
    const length = Object.keys(jsondata).length;
    var array = [];
    removeChildren(document.selectitemform.selectbox1);
    $("#selectbox1").append("<option value=>" + "型番を選択してください" + "</option>");
    // alert('要素数は'+length);//163
    for (let i = 0;i<length;i++){
        // alert(JSON.stringify(jsondata[i].category));
        if (jsondata[i].category == event.currentTarget.value){
            if (array.includes(jsondata[i].model_number) != true){
                $("#selectbox1").append("<option value=" + jsondata[i].model_number + ">" + jsondata[i].model_number + "</option>");
                array.push(jsondata[i].model_number);
                // alert('重複をさけてる？');
            }
        }
    }
    // for (let i = 0;i<length;i++){

    // var table = document.getElementById('esttable');
}
function inputChangemodeln(){
    var jsondata_be = document.getElementById('json').innerHTML;
    jsondata = JSON.parse(jsondata_be);
    const color1 = document.selectitemform.selectbox1;

	// 値(数値)を取得
	const num = color1.selectedIndex;
    var strvalu = document.getElementById("selectbox1")[num].innerHTML;
    const cate_value = document.selectitemform.category.value;
    // alert(document.selectitemform.selectbox2);
    removeChildren(document.selectitemform.selectbox2);
    $("#selectbox2").append("<option value=>" + "商品コードを選択してください" + "</option>");
    const length = Object.keys(jsondata).length;
    for (let i = 0;i<length;i++){
        if (jsondata[i].category == cate_value && jsondata[i].model_number == strvalu){
            $("#selectbox2").append("<option value=" + jsondata[i].name + ">" + jsondata[i].name + "</option>");
        }
    }
}

function removeChildren(x)
{
    // alert('要素削除');
	if (x.hasChildNodes()) {
		while (x.childNodes.length > 0) {
			x.removeChild(x.firstChild)
		}
	}
}
const onlyNumbers = n => {
    return n.replace(/[０-９]/g,s => String.fromCharCode(s.charCodeAt(0) - 65248)).replace(/\D/g,'');
}
