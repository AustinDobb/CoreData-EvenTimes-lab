# CoreDataEvenTimes

## Lab
1. We’re going to make one small change to this project. 
1. The person asking you to make this app really likes even numbers.
1. So they want a checkmark on timestamps that have an even number of minutes and seconds in the timestamp.
1. Lets make the changes together

###  Core Data Model
1. Right now the `Item` entity only has one property: `timestamp: Date`
1. Lets add a new property: `hasEvenMinutesAndSeconds: Boolean`
<img width="1442" alt="image" src="https://user-images.githubusercontent.com/8898675/196342209-a8e82701-8cf4-443f-ae44-afb60b6f3550.png">

### Update the Item
1. Lets add a new function to determine if a particular Date has an even number in both the minutes and seconds
1. Add it right after the `addItem()` func
<img width="1723" alt="image" src="https://user-images.githubusercontent.com/8898675/196342261-8e3695b9-0f5f-411e-b3f6-e4660d639611.png">

1. Now we have to make sure this new property is correct when we create a new `Item`
1. Lets figure out if the Item has an even number of minutes and seconds and save it to the `Item`
1. Make your addItem() look like this:
<img width="1322" alt="image" src="https://user-images.githubusercontent.com/8898675/196342282-ba009ed7-41c6-4f08-9205-cdb09e712b0a.png">

### Update the UI
1. Finally -> Update your UI to show the checkmark for Item’s who’s `hasEvenMinutesAndSeconds` is true
1. Make your NavigationLink look like this:
<img width="1199" alt="image" src="https://user-images.githubusercontent.com/8898675/196342315-fe6dfa77-156e-4a7d-b34f-28c56f6e7a5b.png">


1. Does it look like this?!
<img width="613" alt="image" src="https://user-images.githubusercontent.com/8898675/196342331-c9e988f1-79f6-4137-b514-fbbc8fc0e48e.png">

## Done!

### Time left?
- If you have any remaining time:
    - Try to add something else to the `Item` entity
    - Read from the docs (here)[https://developer.apple.com/documentation/coredata]
    - Start reading the docs for tomorrow's lesson (here)[https://developer.apple.com/documentation/coredata/modeling_data]
