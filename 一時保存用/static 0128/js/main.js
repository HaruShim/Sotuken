/**
 * **** **** **** **** **** **** **** ****
 * サーバとの通信関連
 * **** **** **** **** **** **** **** ****
 */
/**
 * ハイスコアの取得
 */
function getHighScore() {
    $.ajax({
        url: 'score/',
        method: 'GET',
        data: {
        },
        timeout: 10000,
        dataType: "json",
    }).done(function(response) {
        highScore = response.high_score;
    }).fail(function(response) {
        window.alert('getHighScore() : レスポンス失敗');
    });
}

function resetData() {
    resetMap();
    count = 3;
    remainingTime = 15;
    score = 0;
    getHighScore();        // 追加
}