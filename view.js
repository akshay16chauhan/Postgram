let currentData = [];
let currentPage = 1;
const itemsPerPage = 10;
let sortColumn = -1;
let sortDirection = 1;
let currentView = '';

// Table configurations for different views
const tableConfigs = {
    users: {
        headers: ['User ID', 'Email', 'Street', 'City', 'State', 'Pincode', 'Mobile'],
        endpoint: 'api/users.php'
    },
    profiles: {
        headers: ['Profile ID', 'User ID', 'Username', 'First Name', 'Last Name', 'DOB', 'Age'],
        endpoint: 'api/profiles.php'
    },
    posts: {
        headers: ['Post ID', 'Profile ID', 'Caption', 'Created At', 'Modified At', 'Image', 'Video'],
        endpoint: 'api/posts.php'
    },
    friendships: {
        headers: ['Profile ID 1', 'Username 1', 'Profile ID 2', 'Username 2'],
        endpoint: 'api/friendships.php'
    },
    comments: {
        headers: ['Comment ID', 'Post ID', 'Profile ID', 'Comment Text', 'Commented At'],
        endpoint: 'api/comments.php'
    },
    likes: {
        headers: ['Like ID', 'Post ID', 'Profile ID', 'Liked At'],
        endpoint: 'api/likes.php'
    },
    stories: {
        headers: ['Story ID', 'Profile ID', 'Uploaded At', 'Likes', 'Shares', 'Comments'],
        endpoint: 'api/stories.php'
    }
};

// Initialize the page
document.addEventListener('DOMContentLoaded', () => {
    // Add click handlers to view buttons
    document.querySelectorAll('.btn[data-view]').forEach(button => {
        button.addEventListener('click', () => {
            const view = button.dataset.view;
            loadView(view);
            
            // Update active button state
            document.querySelectorAll('.btn[data-view]').forEach(btn => {
                btn.style.backgroundColor = 'var(--light-color)';
                btn.style.color = 'var(--dark-color)';
            });
            button.style.backgroundColor = 'var(--primary-color)';
            button.style.color = 'var(--light-color)';
        });
    });

    // Load users by default
    loadView('users');
    document.querySelector('.btn[data-view="users"]').style.backgroundColor = 'var(--primary-color)';
    document.querySelector('.btn[data-view="users"]').style.color = 'var(--light-color)';
});

// Function to load a specific view
async function loadView(view) {
    currentView = view;
    currentPage = 1;
    showLoading();
    
    try {
        const config = tableConfigs[view];
        if (!config) {
            throw new Error('Invalid view type');
        }

        // Update table headers
        const headerRow = document.getElementById('tableHeader');
        headerRow.innerHTML = `<tr>${config.headers.map((header, index) => 
            `<th onclick="sortTable(${index})">${header}</th>`
        ).join('')}</tr>`;

        // Fetch data
        const response = await fetch(config.endpoint);
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        const data = await response.json();

        if (data.error) {
            throw new Error(data.error);
        }
        
        // Process dates
        currentData = data.map(item => {
            const processed = { ...item };
            Object.keys(processed).forEach(key => {
                if (key.toLowerCase().includes('date') || key.toLowerCase().includes('created')) {
                    processed[key] = processed[key] ? new Date(processed[key]) : null;
                }
            });
            return processed;
        });

        displayData(currentData);
        updatePagination();
    } catch (error) {
        console.error('Error loading view:', error);
        showError('Failed to load data. Please try again later. ' + error.message);
    } finally {
        hideLoading();
    }
}

// Function to show loading indicator
function showLoading() {
    document.getElementById('loadingIndicator').style.display = 'block';
    document.getElementById('errorMessage').style.display = 'none';
}

// Function to hide loading indicator
function hideLoading() {
    document.getElementById('loadingIndicator').style.display = 'none';
}

// Function to show error message
function showError(message) {
    const errorDiv = document.getElementById('errorMessage');
    errorDiv.textContent = message;
    errorDiv.style.display = 'block';
}

// Function to display data in the table
function displayData(data) {
    const tbody = document.getElementById('dataBody');
    tbody.innerHTML = '';
    
    if (!data || data.length === 0) {
        const row = document.createElement('tr');
        row.innerHTML = `<td colspan="${tableConfigs[currentView].headers.length}" style="text-align: center;">No data available</td>`;
        tbody.appendChild(row);
        return;
    }

    const start = (currentPage - 1) * itemsPerPage;
    const end = start + itemsPerPage;
    const pageData = data.slice(start, end);

    pageData.forEach(item => {
        const row = document.createElement('tr');
        const cells = Object.values(item).map(value => {
            if (value instanceof Date) {
                return `<td>${value.toLocaleDateString()}</td>`;
            }
            return `<td>${value !== null ? value : '-'}</td>`;
        });
        row.innerHTML = cells.join('');
        tbody.appendChild(row);
    });
}

// Function to search the table
function searchTable() {
    const input = document.getElementById('searchInput');
    const filter = input.value.toUpperCase();
    const filteredData = currentData.filter(item => {
        return Object.values(item).some(value => 
            String(value).toUpperCase().includes(filter)
        );
    });
    displayData(filteredData);
    updatePagination();
}

// Function to reset search
function resetSearch() {
    document.getElementById('searchInput').value = '';
    displayData(currentData);
    updatePagination();
}

// Function to sort table
function sortTable(columnIndex) {
    if (sortColumn === columnIndex) {
        sortDirection *= -1;
    } else {
        sortColumn = columnIndex;
        sortDirection = 1;
    }

    const headers = document.querySelectorAll('th');
    headers.forEach(header => header.classList.remove('sorted-asc', 'sorted-desc'));
    headers[columnIndex].classList.add(sortDirection === 1 ? 'sorted-asc' : 'sorted-desc');

    currentData.sort((a, b) => {
        const aValue = Object.values(a)[columnIndex];
        const bValue = Object.values(b)[columnIndex];
        
        if (aValue instanceof Date && bValue instanceof Date) {
            return sortDirection * (aValue - bValue);
        }
        if (typeof aValue === 'string' && typeof bValue === 'string') {
            return sortDirection * aValue.localeCompare(bValue);
        }
        if (aValue === null) return 1;
        if (bValue === null) return -1;
        return sortDirection * (aValue - bValue);
    });

    displayData(currentData);
}

// Function to change page
function changePage(delta) {
    const newPage = currentPage + delta;
    const maxPage = Math.ceil(currentData.length / itemsPerPage);
    
    if (newPage >= 1 && newPage <= maxPage) {
        currentPage = newPage;
        displayData(currentData);
        updatePagination();
    }
}

// Function to update pagination controls
function updatePagination() {
    const maxPage = Math.ceil(currentData.length / itemsPerPage);
    document.getElementById('pageInfo').textContent = `Page ${currentPage} of ${maxPage}`;
    document.getElementById('prevPage').disabled = currentPage === 1;
    document.getElementById('nextPage').disabled = currentPage === maxPage;
} 