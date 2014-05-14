# Copyright 2014 David Pearson
# Public domain

# O(nlog(n)) average
quicksort = (arr) ->
	if arr.length <= 1
		arr
	else
		less = []
		greater = []

		pivot = Math.ceil(arr.length / 2) - 1
		pivotVal = arr[pivot]

		i = 0
		while i < pivot
			if arr[i] <= pivotVal
				less.push arr[i]
			else
				greater.push arr[i]
			i += 1

		i = pivot + 1
		while i < arr.length
			if arr[i] <= pivotVal
				less.push arr[i]
			else
				greater.push arr[i]
			i += 1

		less = quicksort less
		greater = quicksort greater
		less[less.length] = pivotVal

		less.concat greater

# O(n^2) average
bubbleSort = (arr) ->
	i = 0
	while i < arr.length
		j = 0
		while j < arr.length - i
			if arr[j] < arr[j - 1]
				t = arr[j]
				arr[j] = arr[j - 1]
				arr[j - 1] = t
			j += 1
		i += 1

	arr

# O(n^2) average
selectionSort = (arr) ->
	i = 0
	while i < arr.length
		min = i
		minVal = arr[i]

		j = min
		while j < arr.length
			if arr[j] < minVal
				min = j
				minVal = arr[j]
			j += 1

		t = arr[i]
		arr[i] = arr[min]
		arr[min] = t

		i += 1
	arr

# O(n^2) average
insertionSort = (arr) ->
	i = 1
	while i < arr.length
		val = arr[i]
		pos = i

		while pos > 0 and val < arr[pos - 1]
			arr[pos] = arr[pos - 1]
			pos -= 1

		arr[pos] = val

		i += 1

	arr

test = (func) ->
	arr = [0,8,3,-6,7,-13]
	console.log func arr

test quicksort
test bubbleSort
test selectionSort
test insertionSort