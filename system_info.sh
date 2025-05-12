# Nazwa komputera
echo "Hostname:" $(hostname)

# Model procesora
echo "CPU Model:" $(lscpu | awk -F: '/Model name/ {print $2}' | xargs)

# Liczba socketów (CPU)
sockets=$(lscpu | awk -F: '/Socket\(s\)/ {print $2}' | xargs)
echo "Socket(s):" $sockets

# Liczba fizycznych rdzeni na socket
cores_per_socket=$(lscpu | awk -F: '/Core\(s\) per socket/ {print $2}' | xargs)
echo "Core(s) per socket:" $cores_per_socket

# Liczba logicznych rdzeni na fizyczny rdzeń
threads_per_core=$(lscpu | awk -F: '/Thread\(s\) per core/ {print $2}' | xargs)
echo "Thread(s) per core:" $threads_per_core

# Liczba fizycznych rdzeni ogółem
total_cores=$((cores_per_socket * sockets))
echo "Core(s) total:" $total_cores

# Liczba logicznych rdzeni ogółem
total_threads=$((total_cores * threads_per_core))
echo "Thread(s) total:" $total_threads

# Ilość pamięci RAM
echo "Total RAM:" $(free -h | grep "Mem:" | awk '{print $2}')

# System operacyjny
echo "Distro:" $(cat /etc/os-release | grep "PRETTY_NAME" | awk -F= '{print $2}' | xargs)
echo "Kernel:" $(uname -r)