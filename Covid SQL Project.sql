select*
From Portfolioproject..['covid deaths']
where continent is not null
order by 3,4

Select *
From PortfolioProject..['covid vaccinations']
where continent is not null
order by 3,4


Select location, date,total_cases, new_cases, total_deaths, population
From PortfolioProject..['covid deaths']
order by 1,2


---shows likelihood of dying of covid in US
Select location, date,total_cases, total_deaths, (total_deaths/total_cases)*100 as Deathpercentage
From PortfolioProject..['covid deaths']
where location like '%states%'
order by 1,2

--looking at total cases vs population
Select location, date,population, total_cases, (total_deaths/population)*100 as Deathpercentage
From PortfolioProject..['covid deaths']
where location like '%states%'
order by 1,2

--looking at countries with highest infection rate compared to population

Select location, population, Max(total_cases) as highestinfectioncount, Max((total_cases/population))*100 as PercentPopulationinfected
From PortfolioProject..['covid deaths']
where location like '%states%'
group by location, population
order by Percentpopulationinfected desc

--showing countries with highest death count per population

Select location, Max(cast(total_deaths as int)) as totaldeathcount
From PortfolioProject..['covid deaths']
--where location like '%states%'
where continent is not null
group by location
order by totaldeathcount desc


--breaking things down by continent

Select Continent , Max(cast(total_deaths as int)) as totaldeathcount
From PortfolioProject..['covid deaths']
--where location like '%states%'
where continent is not null
group by Continent
order by totaldeathcount desc


--showing the continents with the highest death count

Select Continent , Max(cast(total_deaths as int)) as totaldeathcount
From PortfolioProject..['covid deaths']
--where location like '%states%'
where continent is not null
group by Continent
order by totaldeathcount desc

--Global numbers covid cases and covid deaths

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
FROM PortfolioProject..['covid deaths']
--where location like '%states%'
Where continent is not null
--Group by date
Order by 1,2




