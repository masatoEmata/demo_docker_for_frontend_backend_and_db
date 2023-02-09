const tasksTableBodyElm = document.getElementById('tasks');
const taskInputElm = document.getElementById('task-input')
const taskAddButtonElm = document.getElementById("task-add-button" )

async function loadTasks() {
    const response = await fetch('/api/tasks');
    const responseBody = await response.json();
    const tasks = responseBody.tasks

    while(tasksTableBodyElm.firstChild) {
        tasksTableBodyElm.removeChild(tasksTableBodyElm.firstChild)
    }

    tasks.forEach(task => {
        const titleTdElm = document.createElement('td');
        const createdAtTdElm = document.createElement('td');
        titleTdElm.innerText = task.title;
        createdAtTdElm.innerText = task.createdAt;

        const trElm = document.createElement('tr');
        trElm.appendChild(titleTdElm);
        trElm.appendChild(createdAtTdElm);

        tasksTableBodyElm.appendChild(trElm);
    });
}

async function registerTask() {
    const title = taskInputElm.value;
    const requestBody = {
        title: title
    }
    await fetch('/api/tasks', {
        method: 'POST',
        body: JSON.stringify(requestBody)
    })

    await loadTasks();
}

async function main() {
    taskAddButtonElm.addEventListener('click', registerTask)
    await loadTasks();
}

main()
