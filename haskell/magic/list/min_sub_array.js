function minSubArray(array, m) {
  var i, l = array.length, initSum = 0, minSum;
  for (i = 0; i < m && i < l; i++) {
    initSum += array[i];
  }
  if (m >= array.length) {
    return initSum;
  } else {
    minSum = initSum;
    for (i = m; i < l; i++) {
      initSum = initSum - array[i-m] + array[i];
      if (minSum > initSum) {
        minSum = initSum;
      }
    }
    return minSum;
  }
}

minSubArray([2,6,4,2,5,8,3,1], 3)
