document.addEventListener('DOMContentLoaded', function() {
    // Form toggle functionality
    const buttons = document.querySelectorAll('.btn[data-form]');
    const closeButtons = document.querySelectorAll('.close-btn');
    const overlay = document.getElementById('overlay');

    // Show form when button is clicked
    buttons.forEach(button => {
        button.addEventListener('click', function() {
            const formId = this.getAttribute('data-form');
            document.getElementById(formId).style.display = 'block';
            overlay.style.display = 'block';
        });
    });

    // Close form when close button is clicked
    closeButtons.forEach(button => {
        button.addEventListener('click', function() {
            const formContainer = this.closest('.form-container');
            formContainer.style.display = 'none';
            overlay.style.display = 'none';
        });
    });

    // Close form when overlay is clicked
    overlay.addEventListener('click', function() {
        document.querySelectorAll('.form-container').forEach(form => {
            form.style.display = 'none';
        });
        this.style.display = 'none';
    });

    // Notification System
    function showNotification(message, type = 'info', duration = 3000) {
        const container = document.getElementById('notificationContainer');
        const notification = document.createElement('div');
        notification.className = `notification ${type}`;
        
        // Set icon based on type
        let icon;
        switch(type) {
            case 'success':
                icon = '<i class="fas fa-check-circle notification-icon"></i>';
                break;
            case 'error':
                icon = '<i class="fas fa-exclamation-circle notification-icon"></i>';
                break;
            case 'warning':
                icon = '<i class="fas fa-exclamation-triangle notification-icon"></i>';
                break;
            default:
                icon = '<i class="fas fa-info-circle notification-icon"></i>';
        }
        
        notification.innerHTML = `
            ${icon}
            <div class="notification-message">${message}</div>
            <button class="notification-close">&times;</button>
        `;
        
        container.appendChild(notification);
        
        // Auto remove after duration
        setTimeout(() => {
            notification.style.animation = 'slideOut 0.3s ease-out forwards';
            setTimeout(() => notification.remove(), 300);
        }, duration);
        
        // Close button functionality
        notification.querySelector('.notification-close').addEventListener('click', () => {
            notification.style.animation = 'slideOut 0.3s ease-out forwards';
            setTimeout(() => notification.remove(), 300);
        });
    }

    // Handle all form submissions
    const forms = document.querySelectorAll('form');
    forms.forEach(form => {
        form.addEventListener('submit', function(e) {
            e.preventDefault();
            
            const formData = new FormData(this);
            const action = this.getAttribute('action');
            const submitBtn = this.querySelector('.submit-btn');
            
            // Disable submit button and show loading state
            submitBtn.disabled = true;
            submitBtn.classList.add('loading');
            
            fetch(action, {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    showNotification('Data inserted successfully!', 'success');
                    // Reset form and close container
                    this.reset();
                    this.closest('.form-container').style.display = 'none';
                    overlay.style.display = 'none';
                } else {
                    showNotification(data.message || 'Error occurred', 'error');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                showNotification('An error occurred while processing your request.', 'error');
            })
            .finally(() => {
                // Re-enable submit button and remove loading state
                submitBtn.disabled = false;
                submitBtn.classList.remove('loading');
            });
        });
    });
});