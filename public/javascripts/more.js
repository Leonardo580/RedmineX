
$(document).ready(function() {
    const rows=document.getElementsByClassName("priority")
    for (let i=1; i<rows.length; i++){
    const priority=rows.item(i)
    let color={"Low": "background-color:  #00cc66;",
                "Normal": "background-color: #fcc00;",
                "High" : "background-color: #ff6600;",
                "Urgent": "background-color: #ff0000;",
                "Immediate": "background-color: #990000;"}
    priority.parentElement.style=color[priority.textContent]
    priority.parentElement.style["color"]="#000000"
    console.log(color[priority.textContent]);
    }

    
})
     



