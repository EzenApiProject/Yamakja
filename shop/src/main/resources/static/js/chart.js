// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// JavaScript 파일에서 데이터 가져오기

var orderList = [];
var listItems = document.querySelectorAll("#myList li");

listItems.forEach(function(item) {
    orderList.push(item.textContent);
});

console.log(orderList[0].createdAt);

var uniqueCounts = {};

// // 리스트 순회
// orderList.forEach(function(item) {
//     var key = item.createdAt.toString(); // a 속성 값을 문자열로 변환하여 키로 사용
//     if (!uniqueCounts[key]) {
//         uniqueCounts[key] = 1; // 유니크한 값이 처음 나오면 1로 초기화
//     } else {
//         uniqueCounts[key]++; // 이미 나온 값이면 개수 증가
//     }
// });
//
// // 유니크한 값과 그 개수를 출력
// for (var key in uniqueCounts) {
//     if (uniqueCounts.hasOwnProperty(key)) {
//         console.log("값: " + key + ", 개수: " + uniqueCounts[key]);
//     }
// }


// 데이터 사용 예제: 경고창 표시


// Area Chart Example
var ctx = document.getElementById("myAreaChart");
var myLineChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: ["Mar 1", "Mar 2", "Mar 3", "Mar 4", "Mar 5"],
        datasets: [{
            label: "Sessions",
            lineTension: 0.3,
            backgroundColor: "rgba(2,117,216,0.2)",
            borderColor: "rgba(2,117,216,1)",
            pointRadius: 5,
            pointBackgroundColor: "rgba(2,117,216,1)",
            pointBorderColor: "rgba(255,255,255,0.8)",
            pointHoverRadius: 5,
            pointHoverBackgroundColor: "rgba(2,117,216,1)",
            pointHitRadius: 50,
            pointBorderWidth: 2,
            data: [10000, 30162, 26263, 18394, 18287],
        }],
    },
    options: {
        scales: {
            xAxes: [{
                time: {
                    unit: 'date'
                },
                gridLines: {
                    display: false
                },
                ticks: {
                    maxTicksLimit: 7
                }
            }],
            yAxes: [{
                ticks: {
                    min: 0,
                    max: 40000,
                    maxTicksLimit: 5
                },
                gridLines: {
                    color: "rgba(0, 0, 0, .125)",
                }
            }],
        },
        legend: {
            display: false
        }
    }
});