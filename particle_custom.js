// Enhanced Search Area Functionality
document.addEventListener('DOMContentLoaded', function () {
    // Set current year
    const currentYear = new Date().getFullYear();
    const yearSpan = document.querySelector('.current-year');
    if (yearSpan) {
        yearSpan.textContent = currentYear;
    }

    // Initialize particles.js for search area
    function initSearchParticles() {
        if (typeof particlesJS !== 'undefined') {
            particlesJS('particles-js', {
                particles: {
                    number: {
                        value: 50,
                        density: {
                            enable: true,
                            value_area: 800
                        }
                    },
                    color: {
                        value: '#ffffff'
                    },
                    shape: {
                        type: 'circle',
                        stroke: {
                            width: 0,
                            color: '#000000'
                        }
                    },
                    opacity: {
                        value: 0.3,
                        random: true,
                        anim: {
                            enable: true,
                            speed: 1,
                            opacity_min: 0.1,
                            sync: false
                        }
                    },
                    size: {
                        value: 3,
                        random: true,
                        anim: {
                            enable: true,
                            speed: 2,
                            size_min: 0.1,
                            sync: false
                        }
                    },
                    line_linked: {
                        enable: true,
                        distance: 150,
                        color: '#ffffff',
                        opacity: 0.2,
                        width: 1
                    },
                    move: {
                        enable: true,
                        speed: 1,
                        direction: 'none',
                        random: false,
                        straight: false,
                        out_mode: 'out',
                        bounce: false,
                        attract: {
                            enable: false,
                            rotateX: 600,
                            rotateY: 1200
                        }
                    }
                },
                interactivity: {
                    detect_on: 'canvas',
                    events: {
                        onhover: {
                            enable: true,
                            mode: 'grab'
                        },
                        onclick: {
                            enable: true,
                            mode: 'push'
                        },
                        resize: true
                    },
                    modes: {
                        grab: {
                            distance: 140,
                            line_linked: {
                                opacity: 0.5
                            }
                        },
                        push: {
                            particles_nb: 4
                        }
                    }
                },
                retina_detect: true
            });
        }
    }

    // Show search area
    window.showSearchArea = function () {
        const searchArea = document.querySelector('.enhanced-search-area');
        if (searchArea) {
            searchArea.classList.add('active');
            document.body.style.overflow = 'hidden';
            initSearchParticles();

            // Focus on search input
            setTimeout(() => {
                const searchInput = searchArea.querySelector('.search-input');
                if (searchInput) {
                    searchInput.focus();
                }
            }, 300);
        }
    };

    // Close search area
    window.closeSearchArea = function () {
        const searchArea = document.querySelector('.enhanced-search-area');
        if (searchArea) {
            searchArea.classList.remove('active');
            document.body.style.overflow = '';
        }
    };

    // Handle search icon clicks
    document.querySelectorAll('.for-search-show, .icon-search').forEach(element => {
        element.addEventListener('click', function (e) {
            e.preventDefault();
            showSearchArea();
        });
    });

    // Handle close search
    document.querySelectorAll('.search-close-btn, .for-search-close').forEach(element => {
        element.addEventListener('click', function (e) {
            e.preventDefault();
            closeSearchArea();
        });
    });

    // Close search on Escape key
    document.addEventListener('keydown', function (e) {
        if (e.key === 'Escape') {
            closeSearchArea();
        }
    });

    // Close search when clicking outside
    document.querySelector('.enhanced-search-area')?.addEventListener('click', function (e) {
        if (e.target === this) {
            closeSearchArea();
        }
    });

    // Animated Counter for Hero Stats
    function animateCounter(element, start, end, duration) {
        let startTimestamp = null;
        const step = (timestamp) => {
            if (!startTimestamp) startTimestamp = timestamp;
            const progress = Math.min((timestamp - startTimestamp) / duration, 1);
            const currentCount = Math.floor(progress * (end - start) + start);
            element.textContent = currentCount;
            if (progress < 1) {
                window.requestAnimationFrame(step);
            } else {
                element.textContent = end + '+';
            }
        };
        window.requestAnimationFrame(step);
    }

    // Intersection Observer for triggering counter animation
    const observerOptions = {
        threshold: 0.5,
        rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const statNumbers = entry.target.querySelectorAll('.stat-number');
                statNumbers.forEach(stat => {
                    const targetCount = parseInt(stat.getAttribute('data-count'));
                    if (targetCount) {
                        animateCounter(stat, 0, targetCount, 2000);
                    }
                });
                observer.unobserve(entry.target);
            }
        });
    }, observerOptions);

    const heroStats = document.querySelector('.hero-stats');
    if (heroStats) {
        observer.observe(heroStats);
    }

    // Smooth scroll for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        });
    });

    // Subtle parallax effect for hero background
    let ticking = false;
    function updateParallax() {
        const scrolled = window.pageYOffset;
        const heroBackground = document.querySelector('.hero-background');
        if (heroBackground) {
            heroBackground.style.transform = `translateY(${scrolled * 0.3}px)`;
        }
        ticking = false;
    }

    window.addEventListener('scroll', () => {
        if (!ticking) {
            requestAnimationFrame(updateParallax);
            ticking = true;
        }
    });

    // Search form enhancement
    const searchInput = document.querySelector('.search-input');
    if (searchInput) {
        searchInput.addEventListener('input', function () {
            // Add search suggestions logic here if needed
            console.log('Search query:', this.value);
        });
    }
});