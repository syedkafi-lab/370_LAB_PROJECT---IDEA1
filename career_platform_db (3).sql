-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 22, 2025 at 01:19 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `career_platform_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_logs`
--

CREATE TABLE `admin_logs` (
  `log_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `performed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `application_id` int(11) NOT NULL,
  `job_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `resume_id` int(11) DEFAULT NULL,
  `cover_letter` text DEFAULT NULL,
  `status` enum('Applied','Under Review','Shortlisted','Rejected','Hired','Dropped','Selected','job_removed','Withdrawn') DEFAULT NULL,
  `applied_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `rating` tinyint(4) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `recruiter_note` text DEFAULT NULL,
  `recruiter_score` int(11) DEFAULT NULL,
  `recruiter_feedback` text DEFAULT NULL,
  `rated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`application_id`, `job_id`, `student_id`, `resume_id`, `cover_letter`, `status`, `applied_at`, `updated_at`, `rating`, `recruiter_note`, `recruiter_score`, `recruiter_feedback`, `rated_at`) VALUES
(9, 1, 1, 1, NULL, 'Dropped', '2025-12-15 20:32:42', '2025-12-17 13:22:30', 4, 'noice', 8, 'noice', '2025-12-15 21:08:16'),
(10, 4, 1, 1, NULL, 'Dropped', '2025-12-16 19:24:58', '2025-12-17 12:39:37', NULL, NULL, 5, 'noob lmao', '2025-12-16 19:30:30'),
(11, 5, 1, 1, NULL, 'job_removed', '2025-12-17 13:25:46', '2025-12-20 05:31:58', NULL, NULL, 10, 'peak brainrot', '2025-12-17 13:26:41'),
(12, 9, 1, 1, NULL, 'Selected', '2025-12-19 18:42:38', '2025-12-19 18:43:27', NULL, NULL, 5, '', '2025-12-19 18:43:26'),
(13, 11, 1, 1, NULL, 'Selected', '2025-12-22 12:10:05', '2025-12-22 12:12:12', NULL, NULL, 1, 'noob', '2025-12-22 12:10:54');

-- --------------------------------------------------------

--
-- Table structure for table `chat_requests`
--

CREATE TABLE `chat_requests` (
  `request_id` int(11) NOT NULL,
  `recruiter_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `message` text DEFAULT NULL,
  `status` enum('pending','accepted','dismissed') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `company_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `industry` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `website_url` varchar(255) DEFAULT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `recruiter_id` int(11) DEFAULT NULL,
  `company_name` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`company_id`, `user_id`, `name`, `industry`, `description`, `website_url`, `logo_url`, `location`, `created_at`, `recruiter_id`, `company_name`) VALUES
(1, 2, 'Company A', 'Software & IT Services', 'BROKE TECH Ltd is a growing software company specializing in web and mobile application development,\r\ncloud solutions, and enterprise systems. We work with startups and enterprises to deliver scalable and\r\nreliable digital products.\r\n', NULL, NULL, 'Dhaka, Bangladesh', '2025-12-13 20:07:41', 2, 'BROKE TECH Ltd'),
(2, 4, 'Company B', 'Software & IT Services', 'we fix tech ', NULL, NULL, 'Dhaka, Bangladesh', '2025-12-19 16:43:24', 4, 'BROKE TECH Ltd');

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `conversation_id` int(11) NOT NULL,
  `application_id` int(11) NOT NULL,
  `recruiter_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `status` enum('pending','active','closed','locked') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `recruiter_hidden` tinyint(1) NOT NULL DEFAULT 0,
  `student_hidden` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`conversation_id`, `application_id`, `recruiter_id`, `student_id`, `status`, `created_at`, `recruiter_hidden`, `student_hidden`) VALUES
(1, 9, 2, 1, '', '2025-12-17 13:02:44', 0, 0),
(2, 11, 2, 1, 'locked', '2025-12-17 13:26:53', 0, 0),
(3, 12, 2, 1, 'active', '2025-12-20 05:41:30', 0, 0),
(4, 13, 2, 1, 'active', '2025-12-22 12:12:21', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `dismissed_chats`
--

CREATE TABLE `dismissed_chats` (
  `id` int(11) NOT NULL,
  `conversation_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dismissed_jobs`
--

CREATE TABLE `dismissed_jobs` (
  `student_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `dismissed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `interest_match`
--

CREATE TABLE `interest_match` (
  `match_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `student_interested` tinyint(1) DEFAULT 0,
  `recruiter_interested` tinyint(1) DEFAULT 0,
  `is_matched` tinyint(1) DEFAULT 0,
  `student_liked_at` timestamp NULL DEFAULT NULL,
  `recruiter_liked_at` timestamp NULL DEFAULT NULL,
  `matched_at` timestamp NULL DEFAULT NULL,
  `chat_enabled` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `interviews`
--

CREATE TABLE `interviews` (
  `interview_id` int(11) NOT NULL,
  `application_id` int(11) DEFAULT NULL,
  `recruiter_id` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `meeting_link` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `status` enum('scheduled','completed','cancelled') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_postings`
--

CREATE TABLE `job_postings` (
  `job_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `recruiter_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `min_gpa` decimal(3,2) DEFAULT NULL,
  `job_type` enum('internship','full-time','part-time','contract') DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `stipend_salary` varchar(100) DEFAULT NULL,
  `salary_min` decimal(10,2) DEFAULT NULL,
  `salary_max` decimal(10,2) DEFAULT NULL,
  `requirements` text DEFAULT NULL,
  `benefits` text DEFAULT NULL,
  `status` enum('open','closed','paused') DEFAULT 'open',
  `views_count` int(11) DEFAULT 0,
  `posted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deadline` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_postings`
--

INSERT INTO `job_postings` (`job_id`, `company_id`, `recruiter_id`, `title`, `description`, `min_gpa`, `job_type`, `location`, `stipend_salary`, `salary_min`, `salary_max`, `requirements`, `benefits`, `status`, `views_count`, `posted_at`, `deadline`, `created_at`, `is_active`) VALUES
(1, 1, 2, 'Backend Developer Intern', 'Work with PHP & MySQL', 3.00, 'internship', 'Dhaka, Bangladesh', '15000 BDT', NULL, NULL, NULL, NULL, 'open', 0, '2025-12-15 14:25:59', NULL, '2025-12-15 14:26:38', 1),
(4, 1, 2, 'Backend Developer', 'We are looking for a motivated Backend Developer to join our engineering team.\r\nThe candidate will work with PHP and Laravel to build APIs and database-driven\r\napplications. You will collaborate with frontend developers and participate in\r\nreal production-level projects.\r\n\r\nResponsibilities:\r\n- Develop backend features using PHP & Laravel\r\n- Design and optimize MySQL queries\r\n- Maintain REST APIs\r\n- Write clean, maintainable code\r\n\r\nRequirements:\r\n- Basic understanding of backend development\r\n- Familiarity with PHP frameworks\r\n- Knowledge of relational databases', 3.00, 'full-time', 'Dhaka, Bangladesh', '40000', NULL, NULL, NULL, NULL, 'open', 0, '2025-12-16 06:28:49', NULL, '2025-12-16 06:28:49', 1),
(5, 1, 2, 'skibidi toilet', 'siuuuiiii', 3.00, 'full-time', 'Dhaka, Bangladesh', '50000', NULL, NULL, NULL, NULL, 'open', 0, '2025-12-17 13:24:46', NULL, '2025-12-17 13:24:46', 0),
(9, 1, 2, 'Frontend Developer Intern', 'make system UI/UX', 3.00, 'internship', 'Dhaka, Bangladesh', '15000 BDT', NULL, NULL, NULL, NULL, 'open', 0, '2025-12-19 18:18:41', NULL, '2025-12-19 18:18:41', 1),
(10, 1, 2, 'toto', 'flirt', 3.90, 'part-time', 'Merul Badda', '10', NULL, NULL, NULL, NULL, 'open', 0, '2025-12-22 12:07:59', NULL, '2025-12-22 12:07:59', 1),
(11, 1, 2, 'after', 'before', 3.00, 'full-time', 'Dhaka', '10', NULL, NULL, NULL, NULL, 'open', 0, '2025-12-22 12:09:47', NULL, '2025-12-22 12:09:47', 1);

-- --------------------------------------------------------

--
-- Table structure for table `job_recommendations`
--

CREATE TABLE `job_recommendations` (
  `recommendation_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `match_score` decimal(5,2) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_required_skills`
--

CREATE TABLE `job_required_skills` (
  `job_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  `importance` enum('required','preferred') DEFAULT NULL,
  `weight_score` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_skills`
--

CREATE TABLE `job_skills` (
  `job_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_skills`
--

INSERT INTO `job_skills` (`job_id`, `skill_id`) VALUES
(1, 1),
(1, 2),
(1, 6),
(1, 14),
(1, 15);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL,
  `conversation_id` int(11) DEFAULT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `sender_role` enum('recruiter','student') NOT NULL,
  `message` text NOT NULL,
  `sent_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `read_by_student` tinyint(1) NOT NULL DEFAULT 0,
  `read_by_recruiter` tinyint(1) NOT NULL DEFAULT 0,
  `is_read` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `conversation_id`, `sender_id`, `receiver_id`, `sender_role`, `message`, `sent_at`, `read_by_student`, `read_by_recruiter`, `is_read`) VALUES
(6, 2, 2, NULL, 'recruiter', 'yo', '2025-12-19 14:53:11', 1, 1, 0),
(7, 2, 1, NULL, 'student', 'yo', '2025-12-19 14:53:45', 1, 0, 0),
(8, 1, 2, NULL, 'recruiter', 'yo', '2025-12-19 19:16:13', 1, 1, 0),
(9, 3, 1, NULL, 'student', 'hello', '2025-12-20 05:42:01', 1, 1, 0),
(10, 3, 2, NULL, 'recruiter', 'hi', '2025-12-20 05:42:38', 1, 1, 0),
(11, 4, 1, NULL, 'student', 'chudi', '2025-12-22 12:12:41', 1, 1, 0),
(12, 4, 2, NULL, 'recruiter', 'tore', '2025-12-22 12:12:58', 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `topic` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read_status` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_read` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `user_id`, `topic`, `type`, `message`, `read_status`, `created_at`, `is_read`) VALUES
(1, 1, NULL, 'application_reviewed', 'Your application has been reviewed and rated by the recruiter.', 0, '2025-12-16 19:30:24', 1),
(2, 1, NULL, 'application_reviewed', 'Your application has been reviewed and rated by the recruiter.', 0, '2025-12-16 19:30:26', 1),
(3, 1, NULL, 'application_reviewed', 'Your application has been reviewed and rated by the recruiter.', 0, '2025-12-16 19:30:30', 1),
(4, 1, NULL, NULL, '❌ Unfortunately, your application has been declined.', 0, '2025-12-16 20:04:25', 0),
(5, 1, NULL, NULL, '🎉 Congratulations! You have been selected for interview.', 0, '2025-12-16 20:04:28', 0),
(6, 1, NULL, NULL, '❌ Unfortunately, your application has been declined.', 0, '2025-12-16 20:04:29', 0),
(7, 1, NULL, NULL, '❌ Unfortunately, your application has been declined.', 0, '2025-12-16 20:04:37', 0),
(8, 1, NULL, NULL, '🎉 Congratulations! You have been selected for interview.', 0, '2025-12-16 20:04:52', 0),
(9, 1, NULL, NULL, '❌ Unfortunately, your application has been declined.', 0, '2025-12-16 20:05:42', 0),
(10, 1, NULL, NULL, '❌ Unfortunately, your application was declined for \'Backend Developer \'.', 0, '2025-12-17 12:30:57', 0),
(11, 1, NULL, NULL, '❌ Unfortunately, your application was declined for \'Backend Developer \'.', 0, '2025-12-17 12:30:58', 0),
(12, 1, NULL, NULL, '❌ Unfortunately, your application was declined for \'Backend Developer \'.', 0, '2025-12-17 12:30:59', 0),
(13, 1, NULL, NULL, '❌ Unfortunately, your application was declined for \'Backend Developer \'.', 0, '2025-12-17 12:30:59', 0),
(14, 1, NULL, NULL, '❌ Unfortunately, your application was declined for \'Backend Developer \'.', 0, '2025-12-17 12:31:00', 0),
(15, 1, NULL, NULL, '❌ Unfortunately, your application was declined for \'Backend Developer \'.', 0, '2025-12-17 12:31:00', 0),
(16, 1, NULL, NULL, '❌ Unfortunately, your application was declined for \'Backend Developer \'.', 0, '2025-12-17 12:31:00', 0),
(17, 1, NULL, NULL, '❌ Unfortunately, your application was declined for \'Backend Developer \'.', 0, '2025-12-17 12:31:01', 0),
(18, 1, NULL, NULL, '🎉 Congratulations! You have been selected for interview for \'Backend Developer Intern\'.', 0, '2025-12-17 12:31:18', 0),
(19, 1, NULL, NULL, '🎉 Congratulations! You have been selected for interview for \'Backend Developer Intern\'.', 0, '2025-12-17 12:31:18', 0),
(20, 1, NULL, NULL, '🎉 Congratulations! You have been selected for interview for \'Backend Developer Intern\'.', 0, '2025-12-17 12:31:25', 0),
(21, 1, NULL, NULL, '❌ Your application was declined for \'Backend Developer \'.', 0, '2025-12-17 12:39:37', 0),
(22, 1, NULL, NULL, '🎉 You have been selected for interview for \'Backend Developer Intern\'.', 0, '2025-12-17 12:39:44', 0),
(23, 1, NULL, NULL, '💬 A recruiter sent you a chat request for: Backend Developer Intern', 0, '2025-12-17 13:02:44', 0),
(24, 1, NULL, NULL, '❌ Your application was declined for \'Backend Developer Intern\'.', 0, '2025-12-17 13:22:30', 0),
(25, 1, NULL, 'application_reviewed', 'Your application has been reviewed and rated by the recruiter.', 0, '2025-12-17 13:26:41', 1),
(26, 1, NULL, NULL, '🎉 You have been selected for interview for \'skibidi toilet\'.', 0, '2025-12-17 13:26:46', 0),
(27, 1, NULL, NULL, '💬 A recruiter sent you a chat request for: skibidi toilet', 0, '2025-12-17 13:26:53', 0),
(28, 1, NULL, NULL, '🎉 You have been selected for interview for \'skibidi toilet\'.', 0, '2025-12-19 14:31:15', 0),
(29, 2, NULL, 'application_withdrawn', '⚠ A student has withdrawn their application for: skibidi toilet', 0, '2025-12-19 14:54:13', 0),
(30, 1, NULL, 'application_reviewed', 'Your application has been reviewed and rated by the recruiter.', 0, '2025-12-19 18:43:26', 1),
(31, 1, NULL, NULL, '🎉 You have been selected for interview for \'Frontend Developer Intern\'.', 0, '2025-12-19 18:43:27', 0),
(32, 1, NULL, NULL, '❌ Your application was declined for \'skibidi toilet\'.', 0, '2025-12-20 05:31:43', 0),
(33, 1, NULL, NULL, '⚠ The job \'skibidi toilet\' you applied to has been removed by the recruiter.', 0, '2025-12-20 05:35:25', 0),
(34, 1, NULL, NULL, '💬 A recruiter sent you a chat request for: Frontend Developer Intern', 0, '2025-12-20 05:41:30', 0),
(35, 1, NULL, 'application_reviewed', 'Your application has been reviewed and rated by the recruiter.', 0, '2025-12-22 12:10:54', 1),
(36, 1, NULL, NULL, '🎉 You have been selected for interview for \'after\'.', 0, '2025-12-22 12:12:12', 0),
(37, 1, NULL, NULL, '💬 A recruiter sent you a chat request for: after', 0, '2025-12-22 12:12:21', 0);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `project_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `project_url` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recruiters`
--

CREATE TABLE `recruiters` (
  `recruiter_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `linkedin_url` varchar(255) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `full_name` varchar(150) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recruiters`
--

INSERT INTO `recruiters` (`recruiter_id`, `user_id`, `company_id`, `position`, `department`, `phone_number`, `linkedin_url`, `name`, `designation`, `full_name`, `phone`) VALUES
(2, 2, NULL, NULL, NULL, NULL, NULL, 'John Doe', 'HR Manager', 'John Doe', '+880183679125');

-- --------------------------------------------------------

--
-- Table structure for table `resumes`
--

CREATE TABLE `resumes` (
  `resume_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `parsed_text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`parsed_text`)),
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resumes`
--

INSERT INTO `resumes` (`resume_id`, `student_id`, `file_name`, `file_path`, `parsed_text`, `uploaded_at`) VALUES
(1, 1, '1765820858_SUIIIIIIIIIIIII.pdf', '../uploads/resumes/1765820858_SUIIIIIIIIIIIII.pdf', NULL, '2025-12-15 17:47:38'),
(2, 1, '1765822746_1765820858_SUIIIIIIIIIIIII.pdf', '../uploads/resumes/1765822746_1765820858_SUIIIIIIIIIIIII.pdf', NULL, '2025-12-15 18:19:06');

-- --------------------------------------------------------

--
-- Table structure for table `resume_parsed_data`
--

CREATE TABLE `resume_parsed_data` (
  `parsed_id` int(11) NOT NULL,
  `resume_id` int(11) NOT NULL,
  `full_name` varchar(150) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `skills` text DEFAULT NULL,
  `education` text DEFAULT NULL,
  `experience` text DEFAULT NULL,
  `parsed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resume_parsed_data`
--

INSERT INTO `resume_parsed_data` (`parsed_id`, `resume_id`, `full_name`, `email`, `skills`, `education`, `experience`, `parsed_at`) VALUES
(1, 2, NULL, NULL, '', NULL, NULL, '2025-12-15 18:19:09');

-- --------------------------------------------------------

--
-- Table structure for table `resume_reviews`
--

CREATE TABLE `resume_reviews` (
  `review_id` int(11) NOT NULL,
  `resume_id` int(11) DEFAULT NULL,
  `recruiter_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `strengths` text DEFAULT NULL,
  `improvements` text DEFAULT NULL,
  `private_notes` text DEFAULT NULL,
  `reviewed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `saved_jobs`
--

CREATE TABLE `saved_jobs` (
  `saved_job_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `saved_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `saved_jobs`
--

INSERT INTO `saved_jobs` (`saved_job_id`, `student_id`, `job_id`, `saved_at`) VALUES
(1, 1, 1, '2025-12-16 06:44:15');

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `skill_id` int(11) NOT NULL,
  `skill_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`skill_id`, `skill_name`) VALUES
(12, 'algorithms'),
(18, 'communication'),
(5, 'css'),
(11, 'data structures'),
(10, 'django'),
(14, 'git'),
(4, 'html'),
(3, 'javascript'),
(6, 'laravel'),
(16, 'linux'),
(2, 'mysql'),
(8, 'node.js'),
(13, 'oop'),
(1, 'php'),
(17, 'problem solving'),
(9, 'python'),
(7, 'react'),
(15, 'rest api'),
(19, 'teamwork');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `university` varchar(255) DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL,
  `cgpa` decimal(3,2) DEFAULT NULL,
  `graduation_year` year(4) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `profile_picture_url` varchar(255) DEFAULT NULL,
  `linkedin_url` varchar(255) DEFAULT NULL,
  `current_resume_id` int(11) DEFAULT NULL,
  `full_name` varchar(150) DEFAULT NULL,
  `skills` text DEFAULT NULL,
  `projects` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `user_id`, `university`, `major`, `cgpa`, `graduation_year`, `bio`, `profile_picture_url`, `linkedin_url`, `current_resume_id`, `full_name`, `skills`, `projects`) VALUES
(1, NULL, 'BRAC University', 'CSE', 3.00, '2027', NULL, NULL, NULL, NULL, 'Darren Watkins', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_skills`
--

CREATE TABLE `student_skills` (
  `student_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  `proficiency_level` enum('beginner','intermediate','expert') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_skills`
--

INSERT INTO `student_skills` (`student_id`, `skill_id`, `proficiency_level`) VALUES
(1, 1, NULL),
(1, 2, NULL),
(1, 3, NULL),
(1, 4, NULL),
(1, 5, NULL),
(1, 13, NULL),
(1, 14, NULL),
(1, 17, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `system_metrics`
--

CREATE TABLE `system_metrics` (
  `metric_id` int(11) NOT NULL,
  `metric_name` varchar(100) DEFAULT NULL,
  `metric_value` int(11) DEFAULT NULL,
  `recorded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `role` enum('student','recruiter','admin') NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password_hash`, `first_name`, `last_name`, `phone`, `role`, `is_active`, `created_at`) VALUES
(1, 'test@student.com', '$2y$10$tZDDGCy06f891fCzBG3nl.oQR7b7S1PP6xfP.DN48mkkTSn5SO.0S', NULL, NULL, NULL, 'student', 1, '2025-12-13 19:24:36'),
(2, 'recruiter@test.com', '$2y$10$k5gmQvC.VYeH36oOsxBMLutM9q9uposXqcirN5n6bCDLOWVnQu/5.', NULL, NULL, NULL, 'recruiter', 1, '2025-12-13 19:58:32'),
(3, 'system@career.local', 'x', NULL, NULL, NULL, '', 1, '2025-12-19 14:40:26'),
(4, 'sayed@kafi.com', '$2y$10$0uFGom2ZPN3VryTP2V6kIO5debGUb3Pc/uee4mAAEajGN.ZLfrhYq', NULL, NULL, NULL, 'recruiter', 1, '2025-12-19 16:42:08'),
(5, 'mehedi@tamim.com', '$2y$10$W0MwtJg2iU2CUUrtMFpEEOsfri/w7ArsHkWlovnORUni6v0hCl0hm', NULL, NULL, NULL, 'student', 1, '2025-12-19 16:42:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_logs`
--
ALTER TABLE `admin_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`application_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `idx_application_status` (`status`),
  ADD KEY `fk_application_resume` (`resume_id`),
  ADD KEY `fk_app_job` (`job_id`);

--
-- Indexes for table `chat_requests`
--
ALTER TABLE `chat_requests`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `fk_chat_requests_recruiter` (`recruiter_id`),
  ADD KEY `fk_chat_requests_student` (`student_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`company_id`),
  ADD UNIQUE KEY `recruiter_id` (`recruiter_id`),
  ADD KEY `fk_companies_user` (`user_id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`conversation_id`),
  ADD KEY `application_id` (`application_id`);

--
-- Indexes for table `dismissed_chats`
--
ALTER TABLE `dismissed_chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dismissed_jobs`
--
ALTER TABLE `dismissed_jobs`
  ADD PRIMARY KEY (`student_id`,`job_id`),
  ADD KEY `job_id` (`job_id`);

--
-- Indexes for table `interest_match`
--
ALTER TABLE `interest_match`
  ADD PRIMARY KEY (`match_id`),
  ADD UNIQUE KEY `student_id` (`student_id`,`job_id`),
  ADD KEY `job_id` (`job_id`);

--
-- Indexes for table `interviews`
--
ALTER TABLE `interviews`
  ADD PRIMARY KEY (`interview_id`),
  ADD KEY `application_id` (`application_id`),
  ADD KEY `recruiter_id` (`recruiter_id`);

--
-- Indexes for table `job_postings`
--
ALTER TABLE `job_postings`
  ADD PRIMARY KEY (`job_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `recruiter_id` (`recruiter_id`),
  ADD KEY `idx_job_status` (`status`);

--
-- Indexes for table `job_recommendations`
--
ALTER TABLE `job_recommendations`
  ADD PRIMARY KEY (`recommendation_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `job_id` (`job_id`),
  ADD KEY `idx_match_score` (`match_score`);

--
-- Indexes for table `job_required_skills`
--
ALTER TABLE `job_required_skills`
  ADD PRIMARY KEY (`job_id`,`skill_id`),
  ADD KEY `skill_id` (`skill_id`);

--
-- Indexes for table `job_skills`
--
ALTER TABLE `job_skills`
  ADD PRIMARY KEY (`job_id`,`skill_id`),
  ADD KEY `skill_id` (`skill_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `conversation_id` (`conversation_id`),
  ADD KEY `fk_sender` (`sender_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`project_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `recruiters`
--
ALTER TABLE `recruiters`
  ADD PRIMARY KEY (`recruiter_id`),
  ADD KEY `fk_recruiter_company` (`company_id`),
  ADD KEY `fk_recruiters_user` (`user_id`);

--
-- Indexes for table `resumes`
--
ALTER TABLE `resumes`
  ADD PRIMARY KEY (`resume_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `resume_parsed_data`
--
ALTER TABLE `resume_parsed_data`
  ADD PRIMARY KEY (`parsed_id`),
  ADD KEY `resume_id` (`resume_id`);

--
-- Indexes for table `resume_reviews`
--
ALTER TABLE `resume_reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `resume_id` (`resume_id`),
  ADD KEY `recruiter_id` (`recruiter_id`);

--
-- Indexes for table `saved_jobs`
--
ALTER TABLE `saved_jobs`
  ADD PRIMARY KEY (`saved_job_id`),
  ADD UNIQUE KEY `student_id` (`student_id`,`job_id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`skill_id`),
  ADD UNIQUE KEY `name` (`skill_name`),
  ADD UNIQUE KEY `skill_name` (`skill_name`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `fk_current_resume` (`current_resume_id`),
  ADD KEY `fk_students_user` (`user_id`);

--
-- Indexes for table `student_skills`
--
ALTER TABLE `student_skills`
  ADD PRIMARY KEY (`student_id`,`skill_id`),
  ADD KEY `skill_id` (`skill_id`);

--
-- Indexes for table `system_metrics`
--
ALTER TABLE `system_metrics`
  ADD PRIMARY KEY (`metric_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_user_role` (`role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_logs`
--
ALTER TABLE `admin_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `application_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `chat_requests`
--
ALTER TABLE `chat_requests`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `conversation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dismissed_chats`
--
ALTER TABLE `dismissed_chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `interest_match`
--
ALTER TABLE `interest_match`
  MODIFY `match_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `interviews`
--
ALTER TABLE `interviews`
  MODIFY `interview_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_postings`
--
ALTER TABLE `job_postings`
  MODIFY `job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `job_recommendations`
--
ALTER TABLE `job_recommendations`
  MODIFY `recommendation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resumes`
--
ALTER TABLE `resumes`
  MODIFY `resume_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `resume_parsed_data`
--
ALTER TABLE `resume_parsed_data`
  MODIFY `parsed_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `resume_reviews`
--
ALTER TABLE `resume_reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `saved_jobs`
--
ALTER TABLE `saved_jobs`
  MODIFY `saved_job_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `skill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `system_metrics`
--
ALTER TABLE `system_metrics`
  MODIFY `metric_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_logs`
--
ALTER TABLE `admin_logs`
  ADD CONSTRAINT `admin_logs_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `applications`
--
ALTER TABLE `applications`
  ADD CONSTRAINT `applications_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `job_postings` (`job_id`),
  ADD CONSTRAINT `applications_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `applications_ibfk_3` FOREIGN KEY (`resume_id`) REFERENCES `resumes` (`resume_id`),
  ADD CONSTRAINT `fk_app_job` FOREIGN KEY (`job_id`) REFERENCES `job_postings` (`job_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_application_resume` FOREIGN KEY (`resume_id`) REFERENCES `resumes` (`resume_id`) ON DELETE SET NULL;

--
-- Constraints for table `chat_requests`
--
ALTER TABLE `chat_requests`
  ADD CONSTRAINT `fk_chat_requests_recruiter` FOREIGN KEY (`recruiter_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_chat_requests_student` FOREIGN KEY (`student_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `fk_companies_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_company_recruiter` FOREIGN KEY (`recruiter_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `conversations`
--
ALTER TABLE `conversations`
  ADD CONSTRAINT `conversations_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `applications` (`application_id`);

--
-- Constraints for table `dismissed_jobs`
--
ALTER TABLE `dismissed_jobs`
  ADD CONSTRAINT `dismissed_jobs_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dismissed_jobs_ibfk_2` FOREIGN KEY (`job_id`) REFERENCES `job_postings` (`job_id`) ON DELETE CASCADE;

--
-- Constraints for table `interest_match`
--
ALTER TABLE `interest_match`
  ADD CONSTRAINT `interest_match_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `interest_match_ibfk_2` FOREIGN KEY (`job_id`) REFERENCES `job_postings` (`job_id`) ON DELETE CASCADE;

--
-- Constraints for table `interviews`
--
ALTER TABLE `interviews`
  ADD CONSTRAINT `interviews_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `applications` (`application_id`),
  ADD CONSTRAINT `interviews_ibfk_2` FOREIGN KEY (`recruiter_id`) REFERENCES `recruiters` (`recruiter_id`);

--
-- Constraints for table `job_postings`
--
ALTER TABLE `job_postings`
  ADD CONSTRAINT `job_postings_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`),
  ADD CONSTRAINT `job_postings_ibfk_2` FOREIGN KEY (`recruiter_id`) REFERENCES `recruiters` (`recruiter_id`);

--
-- Constraints for table `job_recommendations`
--
ALTER TABLE `job_recommendations`
  ADD CONSTRAINT `job_recommendations_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `job_recommendations_ibfk_2` FOREIGN KEY (`job_id`) REFERENCES `job_postings` (`job_id`);

--
-- Constraints for table `job_required_skills`
--
ALTER TABLE `job_required_skills`
  ADD CONSTRAINT `job_required_skills_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `job_postings` (`job_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `job_required_skills_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`skill_id`) ON DELETE CASCADE;

--
-- Constraints for table `job_skills`
--
ALTER TABLE `job_skills`
  ADD CONSTRAINT `fk_job_skills_job` FOREIGN KEY (`job_id`) REFERENCES `job_postings` (`job_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `job_skills_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `job_postings` (`job_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `job_skills_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`skill_id`) ON DELETE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `fk_sender` FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`conversation_id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE;

--
-- Constraints for table `recruiters`
--
ALTER TABLE `recruiters`
  ADD CONSTRAINT `fk_recruiter_company` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`),
  ADD CONSTRAINT `fk_recruiters_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `recruiters_ibfk_1` FOREIGN KEY (`recruiter_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `resumes`
--
ALTER TABLE `resumes`
  ADD CONSTRAINT `resumes_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE;

--
-- Constraints for table `resume_parsed_data`
--
ALTER TABLE `resume_parsed_data`
  ADD CONSTRAINT `resume_parsed_data_ibfk_1` FOREIGN KEY (`resume_id`) REFERENCES `resumes` (`resume_id`) ON DELETE CASCADE;

--
-- Constraints for table `resume_reviews`
--
ALTER TABLE `resume_reviews`
  ADD CONSTRAINT `resume_reviews_ibfk_1` FOREIGN KEY (`resume_id`) REFERENCES `resumes` (`resume_id`),
  ADD CONSTRAINT `resume_reviews_ibfk_2` FOREIGN KEY (`recruiter_id`) REFERENCES `recruiters` (`recruiter_id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `fk_current_resume` FOREIGN KEY (`current_resume_id`) REFERENCES `resumes` (`resume_id`),
  ADD CONSTRAINT `fk_students_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `student_skills`
--
ALTER TABLE `student_skills`
  ADD CONSTRAINT `student_skills_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_skills_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`skill_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
