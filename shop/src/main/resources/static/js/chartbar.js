// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// JavaScript 파일에서 데이터 가져오기

var orderList = [];
var listItems = document.querySelectorAll("#myList li");
var itemList = [];
var listItems2 = document.querySelectorAll("#myList2 li");

listItems.forEach(function(order) {
    var text = order.textContent;
    var trimmedString = text.replace(/^OrderList\(|\)$/g, '');

// 쉼표(,)로 분리하여 키-값 쌍 생성
    var keyValuePairs = trimmedString.split(', ');

// 결과 객체 초기화
    var resultObject = {};

// 각 키-값 쌍을 객체에 추가
    keyValuePairs.forEach(function(pair) {
        var parts = pair.split('=');
        var key = parts[0].trim();
        var value = parts[1].trim();
        resultObject[key] = value;
    });

    // console.log(resultObject);
    orderList.push(resultObject);
});

// console.log(listItems2);

listItems2.forEach(function(item) {
    var text = item.textContent;
    // console.log(text);
    var trimmedString = text.replace(/^Item\(|\)$/g, '');

// 쉼표(,)로 분리하여 키-값 쌍 생성
    var keyValuePairs = trimmedString.split(', ');

// 결과 객체 초기화
    var resultObject = {};

// 각 키-값 쌍을 객체에 추가
    keyValuePairs.forEach(function(pair) {
        var parts = pair.split('=');
        // console.log(parts[0], parts[1]);
        var key = parts[0].trim();
        var value = parts[1].trim();
        resultObject[key] = value;
    });

    itemList.push(resultObject);
});

// console.log(itemList);

// createdAT 및 itemId를 기준으로 그룹화하고 quantity 합산
var groupedData = {};

orderList.forEach(function(item) {
    var key = item.createdAt + "-" + item.itemID;

    if (!groupedData[key]) {
        groupedData[key] = {
            createdAt: item.createdAt,
            itemID: item.itemID,
            quantity: 0
        };
        // console.log(item.createdAt,item.itemID, groupedData[key].quantity)
    }

    groupedData[key].quantity += parseInt(item.quantity);
    // console.log(item.createdAt,item.itemID, groupedData[key].quantity)
});

// 결과 출력
var resultArray = [];

for (var key in groupedData) {
    if (groupedData.hasOwnProperty(key)) {
        resultArray.push(groupedData[key]);
    }
}

console.log(resultArray);

// createdAt를 기준으로 그룹화하고 quantity 합산
var groupedData = {};
var datelist2 = [];
var revenueList = [];

resultArray.forEach(function(item) {
    var key = item.createdAt;

    if (!groupedData[key]) {
        groupedData[key] = {
            createdAt: item.createdAt,
            sum: 0
        };
    }

    groupedData[key].sum += getPriceByItemId(item.itemID) * item.quantity; // itemID와 quantity 값을 곱한 후 더함
    console.log(item.createdAt, getPriceByItemId(item.itemID) * item.quantity)
});

// 결과 출력
var resultArray = [];

for (var key in groupedData) {
    if (groupedData.hasOwnProperty(key)) {
        resultArray.push(groupedData[key]);
    }
}

var rearrangedResultArray = [];
rearrangedResultArray.push(resultArray[(resultArray.length)-5]);
rearrangedResultArray.push(resultArray[(resultArray.length)-4]);
rearrangedResultArray.push(resultArray[(resultArray.length)-3]);
rearrangedResultArray.push(resultArray[(resultArray.length)-2]);
rearrangedResultArray.push(resultArray[(resultArray.length)-1]);

for (var key in rearrangedResultArray){
    if (rearrangedResultArray.hasOwnProperty(key)){
        datelist2.push(rearrangedResultArray[key].createdAt);
        revenueList.push(rearrangedResultArray[key].sum);
    }
}







// itemId를 입력값으로 받아서 price를 리턴하는 함수
function getPriceByItemId(itemId) {
    // itemId에 해당하는 아이템 찾기
    var item = itemList.find(function(item) {
        return item.itemId === itemId;
    });

    // 아이템이 존재하면 price를 리턴, 아니면 null을 리턴
    return item ? item.price : null;
}










// Bar Chart Example
var ctx = document.getElementById("myBarChart");
var myLineChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: [datelist2[0], datelist2[1], datelist2[2], datelist2[3], datelist2[4]],
        datasets: [{
            label: "매출액",
            backgroundColor: "rgba(2,117,216,1)",
            borderColor: "rgba(2,117,216,1)",
            data: [revenueList[0], revenueList[1], revenueList[2], revenueList[3], revenueList[4], revenueList[5]],
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
                    max: 2500000,
                    maxTicksLimit: 10
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