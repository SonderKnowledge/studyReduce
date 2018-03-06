###
reduce 方法总结
###

# 遍历求和

# 说明其中 r 和 c 是必需参数, index 和 arr 是不必需参数
# r 是初始值如果没有传初始值的话,默认为传入参的第一项,其后 r 为累积的值
# index 为当前的下标, c 为参与叠加的当前项, arr就是本身的arr
arr1 = [1, 2, 3, 4, 5]
sum = arr1.reduce (r, c, index, arr) =>
  console.log 'r--->>>',r,'c--->>>', c, 'index--->>>', index
  return r + c
console.log arr1, sum
###
r--->>> 1 c--->>> 2 index--->>> 1
r--->>> 3 c--->>> 3 index--->>> 2
r--->>> 6 c--->>> 4 index--->>> 3
r--->>> 10 c--->>> 5 index--->>> 4
[ 1, 2, 3, 4, 5 ] 15
###

newSum = arr1.reduce (r, c, index, arr) =>
  console.log 'r--->>>',r,'c--->>>', c, 'index--->>>', index  
  return r + c
, 0
console.log arr1, newSum
###
r--->>> 0 c--->>> 1 index--->>> 0
r--->>> 1 c--->>> 2 index--->>> 1
r--->>> 3 c--->>> 3 index--->>> 2
r--->>> 6 c--->>> 4 index--->>> 3
r--->>> 10 c--->>> 5 index--->>> 4
[ 1, 2, 3, 4, 5 ] 15
###

# 取出对象中的 id 单独放在一个数组中
arr2 = [
  {
    id: 1
    name: 'zhangsan'
  }
  {
    id: 2
    name: 'lisi'
  }
  {
    id: 3
    name: 'wangwu'
  }
]
ids = arr2.reduce (r, c) =>
  [
    r...
    c.id
  ]
, []
console.log ids # [1, 2, 3]

# 将 id 为2的name改为 chenhuan
newArr2 = arr2.reduce (r, c, index, arr2) =>
  if c.id is 2
    arr2[index].name = 'chenhuan'
  arr2   
, []
console.log newArr2
###
[ { id: 1, name: 'zhangsan' },
  { id: 2, name: 'chenhuan' },
  { id: 3, name: 'wangwu' } ]
###

# 删除 id 为3的对象
newArr3 = arr2.reduce (r, c, index, arr2) =>
  if c.id is 3
    arr2.splice index, 1
  arr2
, null
console.log newArr3 # [ { id: 1, name: 'zhangsan' }, { id: 2, name: 'chenhuan' } ]

# 记录一个字符串中每个字母出现的次数
str = 'abcdaabc'
num = str.split('').reduce (r, c) =>
  console.log 'r--->>>>', r, 'c---->>>>', c
  console.log 'r[c]---->>>>', r[c]
  console.log 'c---->>>>', c
  if r[c]
  then r[c]++
  else r[c] = 1
  r
, {}
console.log num # { a: 3, b: 2, c: 2, d: 1 }

# 返回key-value的形式
classes = [
  'a'
  'b'
  'c'
]

allClasses = classes.reduce (r, c) =>
  {
    r...
    "#{c}"
  }
, {}

console.log allClasses # { a: 'a', b: 'b', c: 'c' }
