-- models/dev/top_customers.sql
with
    orders as (
        select o_orderkey, o_custkey, o_totalprice, o_orderdate
        from snowflake_sample_data.tpch_sf1.orders
        where o_orderdate >= '1995-01-01'
    ),
    customers as (
        select c_custkey, c_name, c_acctbal, c_nationkey
        from snowflake_sample_data.tpch_sf1.customer
    )
select
    c.c_name as customer_name,
    sum(o.o_totalprice) as total_spent,
    count(o.o_orderkey) as total_orders
from orders o
join customers c on o.o_custkey = c.c_custkey
group by c.c_name
order by total_spent desc
limit 10
;
