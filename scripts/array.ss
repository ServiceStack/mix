```code
`Create an Array`
['Apple', 'Banana'] | to => fruits
fruits.Count

`\nAccess (index into) an Array Item`
fruits[0] | to => first
first

`\nLoop over an Array`
#each item in fruits
    `${item}, ${index}`
/each

[] | to => sb
fruits.forEach((item,index,array) => sb.push(`${item}, ${index}`))
sb.join(`\n`)

`\nAdd to the end of an Array`

fruits.push('Orange') | to => newLength
newLength

`\nRemove from the end of an Array`
fruits.pop() | to => last
last

`\nRemove from the front of an Array`
fruits.shift() | to => first
first

`\nAdd to the front of an Array`
fruits.unshift('Strawberry') | to => newLength
newLength

`\nFind the index of an item in the Array`
fruits.push('Mango') | end

fruits.indexOf('Banana') | to => pos
pos

`\nRemove an item by index position`
fruits.splice(pos, 1) | to => removedItem
removedItem | join
fruits | join

`\nRemove items from an index position`
['Cabbage', 'Turnip', 'Radish', 'Carrot'] | to => vegetables 
vegetables | join

1 | to => pos
2 | to => n

vegetables.splice(pos, n) | to => removedItems 
vegetables | join
removedItems | join

`\nCopy an Array`
fruits.slice() | join
```