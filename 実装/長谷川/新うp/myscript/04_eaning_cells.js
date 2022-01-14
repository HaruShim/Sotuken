// 行追加作業-------------------------------------------------------------------------------------------------------------------------------------------------
// 必要数以上行追加させないためのフラグ falseなら行未追加－＞追加できる
var flg = 0;
// 行追加
function insertEarningRow(id) {
    var today = new Date();
    // テーブル取得
    var table = document.getElementById(id);
    if (flg == 0) {
        if (document.getElementById("earning_select").value == "returnItem") {
            // 行を行末に追加
            var row = table.insertRow(-1);
            flg = 1;
            // セルの挿入
            var cell1 = row.insertCell(-1);
            var cell2 = row.insertCell(-1);
            var cell3 = row.insertCell(-1);
            var cell4 = row.insertCell(-1);
            var cell5 = row.insertCell(-1);
            var cell6 = row.insertCell(-1);
            var cell7 = row.insertCell(-1);
            var cell8 = row.insertCell(-1);
            var cell9 = row.insertCell(-1);
            var cell10 = row.insertCell(-1);
            var cell11 = row.insertCell(-1);
            // ボタン用 HTML
            var button = '<a id="deleteBtn" class="btn btn-small" onclick="deleteRow(this)">取消</a>';
            // 行数取得
            var row_len = table.rows.length;
            // セルの内容入力
            // 見づらければCSSで販売価格以外の文字を透明にしますか？？？？？？？？？？？？？？
            cell1.innerHTML = document.getElementsByTagName("td")[0].textContent;
            cell2.innerHTML = today.getFullYear() + "/" + (today.getMonth()+1) + "/" + ("0"+today.getDate()).slice(-2);
            cell3.innerHTML = document.getElementsByTagName("td")[2].textContent;
            cell4.innerHTML = document.getElementsByTagName("td")[3].textContent;
            cell5.innerHTML = document.getElementsByTagName("td")[4].textContent;
            cell6.innerHTML = parseInt(document.getElementsByTagName("td")[5].textContent) * -1 + " 円";
            cell7.innerHTML = 0;
            cell8.innerHTML = (parseInt(cell7.innerHTML) / parseInt(cell5.innerHTML)).toFixed(2) + " %";
            cell9.innerHTML = document.getElementsByTagName("td")[8].textContent;
            cell10.innerHTML = "大原太郎";
            cell11.innerHTML = button;
        // 金額修正------------------------------------------------------------------------------------------------------------------
        } else if (document.getElementById("earning_select").value == "fixEarning" && document.getElementById("umoney").value != 0){
            // 行を行末に追加
            row = table.insertRow(-1);
            flg = 2;
            // セルの挿入
            var cell1 = row.insertCell(-1);
            var cell2 = row.insertCell(-1);
            var cell3 = row.insertCell(-1);
            var cell4 = row.insertCell(-1);
            var cell5 = row.insertCell(-1);
            var cell6 = row.insertCell(-1);
            var cell7 = row.insertCell(-1);
            var cell8 = row.insertCell(-1);
            var cell9 = row.insertCell(-1);
            var cell10 = row.insertCell(-1);
            // 行数取得
            var row_len = table.rows.length;
            // セルの内容入力
            // 見づらければCSSで販売価格以外の文字を透明にしますか？？？？？？？
            cell1.innerHTML = document.getElementsByTagName("td")[0].textContent;
            cell2.innerHTML = today.getFullYear() + "/" + (today.getMonth()+1) + "/" + ("0"+today.getDate()).slice(-2);
            cell3.innerHTML = document.getElementsByTagName("td")[2].textContent;
            cell4.innerHTML = document.getElementsByTagName("td")[3].textContent;
            cell5.innerHTML = document.getElementsByTagName("td")[4].textContent;
            cell6.innerHTML = parseInt(document.getElementsByTagName("td")[5].textContent) * -1 + " 円";
            cell7.innerHTML = 0;
            cell8.innerHTML = (parseInt(cell7.innerHTML) / parseInt(cell5.innerHTML)).toFixed(2) + " %";
            cell9.innerHTML = document.getElementsByTagName("td")[8].textContent;
            cell10.innerHTML = "大原太郎";
            // 行を行末に追加
            var row = table.insertRow(-1);
            // セルの挿入
            var cell1 = row.insertCell(-1);
            var cell2 = row.insertCell(-1);
            var cell3 = row.insertCell(-1);
            var cell4 = row.insertCell(-1);
            var cell5 = row.insertCell(-1);
            var cell6 = row.insertCell(-1);
            var cell7 = row.insertCell(-1);
            var cell8 = row.insertCell(-1);
            var cell9 = row.insertCell(-1);
            var cell10 = row.insertCell(-1);
            var cell11 = row.insertCell(-1);
            // ボタン用 HTML
            var button = '<a id="deleteBtn" class="btn btn-small" onclick="deleteRow(this)">取消</a>';
            // 行数取得
            var row_len = table.rows.length;
            // セルの内容入力
            // 見づらければCSSで販売価格以外の文字を透明にしますか？？？？？？？？？？？？？？
            cell1.innerHTML = document.getElementsByTagName("td")[0].textContent;
            cell2.innerHTML = today.getFullYear() + "/" + (today.getMonth()+1) + "/" + ("0"+today.getDate()).slice(-2);
            cell3.innerHTML = document.getElementsByTagName("td")[2].textContent;
            cell4.innerHTML = document.getElementsByTagName("td")[3].textContent;
            cell5.innerHTML = document.getElementsByTagName("td")[4].textContent;
            cell6.innerHTML = (document.getElementById("umoney")).value + " 円";
            cell7.innerHTML = (parseInt(cell6.innerHTML)) - (parseInt(cell5.innerHTML));
            cell8.innerHTML = ((parseInt(cell7.innerHTML) / parseInt(cell5.innerHTML))*100).toFixed(1)+ " %";
            cell9.innerHTML = document.getElementsByTagName("td")[8].textContent;
            cell10.innerHTML = "大原太郎";
            cell11.innerHTML = button;
        }
    }
}
// 行削除-------------------------------------------------------------------------
function deleteRow(obj) {
    if (flg == 1) {
        // 削除ボタンを押下された行を取得
        tr = obj.parentNode.parentNode;
        // trのインデックスを取得して行を削除する
        tr.parentNode.deleteRow(tr.sectionRowIndex);
    } else if (flg == 2) {
        // 削除ボタンを押下された行を取得
        tr = obj.parentNode.parentNode;
        // trのインデックスを取得して行を削除する
        tr.parentNode.deleteRow((tr.sectionRowIndex)-1);
        tr.parentNode.deleteRow(tr.sectionRowIndex);
    }
    flg = 0;
}




// 作業切替で販売価格を消してテキストボックスを入力不可に----------------------------------------------------------------------------------------------
function rowCheck() {
    // 作業切り替えで追加内容の削除
    if (flg != 0) {
    document.getElementById("deleteBtn").click();
    }
    // 返品返金で販売価格の入力不可
    if (document.getElementById("earning_select").value == "fixEarning"){
        // disabled属性を削除
        document.getElementById("umoney").removeAttribute("disabled");
        document.getElementById("umoney").style.color = "black";
    }else if(document.getElementById("earning_select").value == "returnItem"||document.getElementById("earning_select").value == "repayment"){
        // 販売価格テキストボックスをクリア
        (document.getElementById("umoney")).value="";
        // disabled属性を設定
        document.getElementById("umoney").setAttribute("disabled", true);
        document.getElementById("umoney").style.color = "White";
    }
}