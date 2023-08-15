

document.addEventListener("DOMContentLoaded", function() {
    const rows = document.getElementsByClassName("priority");
    const color = {
        "Low": "background-color: rgba(0, 204, 102, 0.5);",
        "Normal": "background-color: rgba(255, 204, 0, 0.5);",
        "High": "background-color: rgba(255, 102, 0, 0.5);",
        "Urgent": "background-color: rgba(255, 0, 0, 0.5);",
        "Immediate": "background-color: rgba(153, 0, 0, 0.5);"
    };

    for (let i = 1; i < rows.length; i++) {
        const priority = rows[i];
        const priorityText = priority.textContent.trim();
        const priorityColor = color[priorityText];

        if (priorityColor) {
            priority.parentElement.style.cssText = priorityColor;
            priority.parentElement.style.color = "#000000";

        }

        // console.log(priorityColor);
    }

});



     



