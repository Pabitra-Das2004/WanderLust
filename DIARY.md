# WanderLust Escapes - Project Diary

This document chronologically tracks the features built, architectural changes, and bug fixes implemented throughout the development of the **WanderLust Escapes** travel and tourism management system.

## Phase 1: Foundation & Initial Setup
**Objective:** Establish a robust full-stack architecture for a travel management system.
- **Tech Stack:** React (Vite), Node.js (Express), MySQL.
- **Architecture:** Strict MVC (Model-View-Controller) structure.
- **Features Implemented:**
  - User Authentication (Registration & Login).
  - Service management & browsing (Users can browse available travel services).
  - Booking system foundation.
  - Integration with Razorpay for handling payments.
  - Basic Admin Dashboard skeleton.

## Phase 2: Database Migration (MySQL to PostgreSQL)
**Objective:** Transition the application's underlying database to PostgreSQL for enhanced features and scalability.
- **Dependencies:** Installed and configured the `pg` library.
- **Database Configuration:** Set up a central connection pool in `config/db.js`.
- **Query Refactoring:** 
  - Updated all SQL queries across controllers from MySQL syntax (`?`) to PostgreSQL parameterized queries (`$1`, `$2`).
  - Implemented `RETURNING *` for immediate data retrieval on `INSERT` and `UPDATE` operations.
- **Schema Migration:** Successfully migrated tables: `users`, `services`, `bookings`, and `payments`.

## Phase 3: Demo Environment & Admin Setup
**Objective:** Streamline the application for demonstration purposes and build out administrative capabilities.
- **Authentication Adjustments:** Disabled `bcrypt` password hashing temporarily to utilize plain-text passwords for easier testing in the demo environment.
- **Auto-Initialization:** Implemented logic to automatically create a default admin user (`das@gmail.com`) upon server startup.
- **Access Control:** Added robust Admin-specific middleware to enforce strict role-based access control (RBAC).
- **Backend APIs:** Created comprehensive routes for managing users, services, bookings (including complex data joins), payments, and retrieving dashboard summaries.
- **Frontend Admin Integration:** Built minimal, functional admin pages to test the demo flows.

## Phase 4: Finalizing Admin Dashboard Functionality
**Objective:** Polish the Admin Dashboard UI and ensure robust data retrieval.
- **UI/UX Polish:** Refined the presentation of users, services, bookings, and payments data on the frontend.
- **Data Fetching:** Validated and strengthened frontend-to-backend API integration to ensure real-time, accurate dashboard data.
- **Bug Fixes:** Resolved remaining dependency and logic gaps to ensure the complete demo environment was fully operational and stable.

## Phase 5: Reverting Razorpay Payment Flow
**Objective:** Restore standard payment logic by removing demo/bypass configurations.
- **Backend Cleanup:** Removed the simulated `/api/payment/demo-upi-success` route and stripped out payment verification bypass logic.
- **Frontend Adjustments (`Payment.jsx`):** 
  - Removed forced timeouts and automatic success triggers.
  - Ensured the UI waits for the genuine Razorpay webhook/response.
  - Prevented premature auto-redirection; the app now correctly waits for confirmed payment success from the Razorpay callback before redirecting the user.

## Phase 6: Analytics & Data Visualization
**Objective:** Enhance the Admin and Creator dashboards with actionable insights.
- **Library Integration:** Introduced `recharts` for dynamic data visualization.
- **Dashboard Enhancements:**
  - Implemented real-time dynamic bar charts.
  - Added visualization for **Service Popularity** based on booking volume.
  - Added visualization for **Revenue Generation** per individual service.
  - Tailored insights to display relevant data appropriately for both Admin and Creator user roles.
