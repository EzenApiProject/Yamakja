// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// // JavaScript 파일에서 데이터 가져오기
//
// var orderList = [];
// var listItems = document.querySelectorAll("#myList li");
//
// listItems.forEach(function(item) {
//     var text = item.textContent;
//     var trimmedString = text.replace(/^OrderList\(|\)$/g, '');
//
// // 쉼표(,)로 분리하여 키-값 쌍 생성
//     var keyValuePairs = trimmedString.split(', ');
//
// // 결과 객체 초기화
//     var resultObject = {};
//
// // 각 키-값 쌍을 객체에 추가
//     keyValuePairs.forEach(function(pair) {
//         var parts = pair.split('=');
//         var key = parts[0].trim();
//         var value = parts[1].trim();
//         resultObject[key] = value;
//     });
//
//     orderList.push(resultObject);
// });
//
// console.log(orderList[0]);
//
// // 유니크한 값과 개수를 저장할 객체 생성
// var uniqueCounts = {};
//
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
// var listDate = [];
// var listCount = [];
//
// // 객체에서 값 추출 및 로그로 출력 (5개만)
// var count = 0; // 출력된 값의 개수를 세는 변수
// for (var key in uniqueCounts) {
//     if (uniqueCounts.hasOwnProperty(key)) {
//         console.log(key + ": " + uniqueCounts[key]);
//         count++;
//
//         listDate.push(key);
//         listCount.push(uniqueCounts[key]);
//
//         if (count >= 5) {
//             break; // 5개 이상 출력되면 루프 종료
//         }
//     }
// }




// Bar Chart Example
var ctx = document.getElementById("myBarChart");
var myLineChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ["January", "February", "March", "April", "May", "June"],
        datasets: [{
            label: "Revenue",
            backgroundColor: "rgba(2,117,216,1)",
            borderColor: "rgba(2,117,216,1)",
            data: [4215, 5312, 6251, 7841, 9821, 14984],
        }],
    },
    options: {
        scales: {
            xAxes: [{
                time: {
                    unit: 'month'
                },
                gridLines: {
                    display: false
                },
                ticks: {
                    maxTicksLimit: 6
                }
            }],
            yAxes: [{
                ticks: {
                    min: 0,
                    max: 15000,
                    maxTicksLimit: 5
                },
                gridLines: {
                    display: true
                }
            }],
        },
        legend: {
            display: false
        }
    }
});