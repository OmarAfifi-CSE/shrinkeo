document.addEventListener('DOMContentLoaded', () => {
    // Force scroll to top on refresh
    if ('scrollRestoration' in history) {
        history.scrollRestoration = 'manual';
    }
    window.scrollTo(0, 0);

    // 0. Initialize Compression Background
    if (typeof CompressionBackground !== 'undefined') {
        new CompressionBackground('network-canvas');
    }

    // 1. Navbar Scroll Effect
    const navbar = document.querySelector('.navbar');
    
    window.addEventListener('scroll', () => {
        if (window.scrollY > 50) {
            navbar.classList.add('scrolled');
        } else {
            navbar.classList.remove('scrolled');
        }
    });

    // 2. Intersection Observer for Fade-Up Animations
    const observerOptions = {
        root: null,
        rootMargin: '0px',
        threshold: 0.15
    };

    const observer = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('visible');
                // Optional: Stop observing once animated
                observer.unobserve(entry.target);
            }
        });
    }, observerOptions);

    // Select all elements with the fade-up class
    const fadeElements = document.querySelectorAll('.fade-up');
    fadeElements.forEach(el => {
        observer.observe(el);
    });

    // 3. Fetch latest version tag from GitHub for badge update
    async function fetchLatestRelease() {
        try {
            const response = await fetch('https://api.github.com/repos/OmarAfifi-CSE/shrinkeo/releases/latest');
            if (!response.ok) return;
            const data = await response.json();
            
            // Update version badge if it exists
            const versionBadge = document.querySelector('.badge');
            if (versionBadge && data.tag_name) {
                versionBadge.innerText = `${data.tag_name} is Here 🎬`;
            }
        } catch (error) {
            console.error('Error fetching release tag:', error);
        }
    }

    fetchLatestRelease();
});
