document.addEventListener('DOMContentLoaded', function () {
    const executeBtn = document.getElementById('executeBtn');
    if (executeBtn) {
        executeBtn.addEventListener('click', executeQuery);
    }
});

function executeQuery() {
    const querySelect = document.getElementById('querySelect');
    const customQueryInput = document.getElementById('customQuery');
    const selectedQuery = querySelect.value;
    const customQuery = customQueryInput.value.trim();
    const resultTableBody = document.querySelector('#resultTable tbody');
    const headerRow = document.querySelector('#resultTable thead tr');

    resultTableBody.innerHTML = '';
    headerRow.innerHTML = '';

    const formData = new URLSearchParams();
    if (customQuery) {
        formData.append('customQuery', customQuery);
    } else {
        formData.append('query', selectedQuery);
    }

    fetch('execution_query.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: formData.toString()
    })
    .then(response => response.json())
    .then(results => {
        if (results.error) {
            alert(results.error);
            return;
        }

        if (results.length > 0) {
            Object.keys(results[0]).forEach(key => {
                const th = document.createElement('th');
                th.textContent = key;
                headerRow.appendChild(th);
            });

            results.forEach(row => {
                const tr = document.createElement('tr');
                Object.values(row).forEach(cell => {
                    const td = document.createElement('td');
                    td.textContent = cell;
                    tr.appendChild(td);
                });
                resultTableBody.appendChild(tr);
            });
        } else {
            const tr = document.createElement('tr');
            const td = document.createElement('td');
            td.colSpan = 100;
            td.textContent = 'No results found.';
            tr.appendChild(td);
            resultTableBody.appendChild(tr);
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('An error occurred while fetching query results.');
    });
}
